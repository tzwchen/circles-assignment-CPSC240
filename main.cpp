/****************************************************************************************************************************
//Program name: "Circles". The purpose of this program is to calculate the area of a circle based on user input radius.
//Copyright (C) 2026 Tristan chen *
// *
//This file is part of the software program "Circles". *
//"Circles" is free software: you can redistribute it and/or modify it under the terms of the GNU General
Public *
//License version 3 as published by the Free Software Foundation. *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
for more details. *
//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: *
//<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: tchen2006@csu.fullerton.edu *
//****************************************************************************************************************************/

//purpose of this program: main cpp file that calls assembly functions to calculate area of circle, it is the driver.

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