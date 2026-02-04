#!/bin/bash
echo "Compiling and running circle program..."

nasm -f elf64 -o circle.o circle.asm
nasm -f elf64 -o isfloat.o isfloat.asm

g++ -o circle main.cpp circle.o isfloat.o -no-pie
./circle
rm circle.o isfloat.o circle

echo "Done. All files cleaned up."