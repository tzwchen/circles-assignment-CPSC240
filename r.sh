#!/bin/bash
echo "Compiling and running circle program..."

nasm -f elf64 -o circle.o circle.asm
g++ -o circle main.cpp circle.asm
./circle
rm circle

echo "Done."