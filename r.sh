#/****************************************************************************************************************************
#//Program name: "Circles". The purpose of this program is to calculate the area of a circle based on user input radius.
#//Copyright (C) 2026 Tristan chen *
#// *
#//This file is part of the software program "Circles". *
#//"Circles" is free software: you can redistribute it and/or modify it under the terms of the GNU General
#Public *
#//License version 3 as published by the Free Software Foundation. *
#//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
#implied *
#//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
#for more details. *
#//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: *
#//<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: tchen2006@csu.fullerton.edu *
#//****************************************************************************************************************************/

#Author: Tristan Chen
#Program name: Circles

#!/bin/bash
echo "Compiling and running circle program..."

nasm -f elf64 -o circle.o circle.asm
nasm -f elf64 -o isfloat.o isfloat.asm

g++ -o circle main.cpp circle.o isfloat.o -no-pie
./circle
rm circle.o isfloat.o circle

echo "Done. All files cleaned up."