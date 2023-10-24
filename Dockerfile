FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

# RUN apt-get update && apt-get -y install git cmake \
#     make gcc libssl-dev unixodbc odbcinst unixodbc-dev
#
# RUN git clone https://github.com/MariaDB/mariadb-connector-odbc.git
#
# WORKDIR ./mariadb-connector-odbc
#
# RUN git checkout 3.1.10
#
# RUN cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCONC_WITH_UNIT_TESTS=Off \
#     -DCONC_WITH_MSI=OFF -DCMAKE_INSTALL_PREFIX=/usr/local .  \
#     && cmake --build . --config RelWithDebInfo

RUN apt-get update
RUN apt-get install -y git cmake make gcc g++ libssl-dev
RUN mkdir -p /app/3party
WORKDIR /app/3party
RUN git clone https://github.com/MariaDB-Corporation/mariadb-connector-cpp.git
RUN cd mariadb-connector-cpp && mkdir cmake-build
WORKDIR mariadb-connector-cpp/cmake-build
RUN cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCONC_WITH_UNIT_TESTS=Off -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_SSL=OPENSSL
RUN cmake --build . --config RelWithDebInfo
RUN make install

RUN cd /app && mkdir cmake-build
WORKDIR /app

COPY . .

WORKDIR /app/cmake-build
# RUN cmake .. && cmake --build .
