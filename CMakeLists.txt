cmake_minimum_required(VERSION 3.16.3)
project(TestMariaDbConnector)

set(CMAKE_CXX_STANDARD 17)

# set(PATH_TO_MARIADB_C "/build")
# set(CMAKE_PREFIX_PATH "${PATH_TO_MARIADB_C};${CMAKE_BINARY_DIR};${CMAKE_PREFIX_PATH}")
#
# find_package(mariadb-connector-c REQUIRED)
#
# if(mariadb-connector-c_FOUND)
#     message(STATUS "mariadb includes path: ${mariadb-connector-c_INCLUDE_DIR}")
#     message(STATUS "mariadb binaries path: ${mariadb-connector-c_LIBRARIES}")
#     include_directories("${mariadb-connector-c_INCLUDE_DIR}")
#     add_executable(TestMariaDbConnector main)
#     target_link_libraries(TestMariaDbConnector ${mariadb-connector-c_LIBRARIES})
# else()
#     message(FATAL_ERROR "Can't find 3rdParty!")
#     message(STATUS "mariadb-connector-c_FOUND=${mariadb-connector-c_FOUND}")
# endif()

# set(libmaodbc "/usr/local/mariadb/libmaodbc.so")
# set(libmariadb "/usr/local/mariadb/libmariadb.so.3")
# set(mariadb_includes "/mariadb-connector-odbc/libmariadb/include")

set(libmariadbcpp "/app/3party/mariadb-connector-cpp/cmake-build/libmariadbcpp.so")
set(libmariadbcpp_includes "/app/3party/mariadb-connector-cpp/include")

include_directories("${libmariadbcpp_includes}")
add_executable(TestMariaDbConnector main)
target_link_libraries(TestMariaDbConnector ${libmariadbcpp})
