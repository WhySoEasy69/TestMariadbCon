#include <iostream>
#include <mariadb/conncpp.hpp>

int main() {
    std::cout << "Hello, World!" << std::endl;
    sql::Driver* driver = sql::mariadb::get_driver_instance();
    return 0;
}
