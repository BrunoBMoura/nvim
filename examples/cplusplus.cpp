#include <bits/stdc++.h>

namespace Simple {

    class Animal {
        public:
            virtual void walk();
            virtual void eat();
            virtual void something_else();
    };

    class Dog : public Animal {
        public:
            void walk() {}
            void eat() {}
            void something_else() {}
    };

    template <typename T>
    T comparison(T val1, T val2) {
        return val1 > val2 ? 0 : 1;
    }

    void getinfo();

    void getinfoready() {
        std::cout << "GETINFOREADY" << std::endl;
    }
};

Simple::getinfo() {
    std::cout << "GETINFO" << std::endl;
}

void main() {

    Simple::getinfoready();
    Simple::getinfo();

    std::vector<Simple> vet;

    for (const auto &it : vet) {
        std::cout << *it << std::endl;
        it.walk();
    }

    std::vector<std::string> another_vet = {
        "Any", "String", "Here", "Will", "Work"
    };

    return;
}
