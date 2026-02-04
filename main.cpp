#include <stdio.h>
#include <iostream>
using namespace std;

extern "C" {
    double circle();
    double isfloat();
}

int main() {
    cout << "Welcome to circles." << endl;
    cout << "This program was created and is maintained by Tristan Chen." << endl;
    circle();
    return 0;
    
}