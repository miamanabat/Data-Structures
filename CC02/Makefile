# Author: Mia Manabat
# E-mail: mmanabat@nd.edu
#
# This is the Makefile for Coding Challenge 02

# G++ is for the GCC compiler for C++
PP := g++

# CFLAGS are the compiler flages for when we compile C++ code in this course
FLAGS := -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm
CXXFLAGS := -m64 -std=c++11 -Weffc++ $(FLAGS)

# Folder Variables
SRC := src
INC := inc
OBJ := obj
EXE := exe

# Initialize the folders for the objects and executables
initialize:
	rm -rf $(OBJ) $(EXE)
	mkdir $(OBJ) $(EXE)

# Creating the object files and placing them in the objects folder
$(OBJ)/JKFF.o: $(SRC)/JKFF.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/JKFF.cpp -o $@

# Create the main object
$(OBJ)/JK_Test.o: $(SRC)/JK_Test.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/JK_Test.cpp -o $@

# JK Objects
JKObjs := $(OBJ)/JKFF.o $(OBJ)/JK_Test.o

# Executable
JK_Test: $(JKObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/JK_Test $(JKObjs)


# BDC object files
$(OBJ)/BDC.o: $(SRC)/BDC.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/BDC.cpp -o $@

# Create the main object
$(OBJ)/BDC_Test.o: $(SRC)/BDC_Test.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/BDC_Test.cpp -o $@

# BDC Objects
BDCObjs := $(OBJ)/JKFF.o $(OBJ)/BDC.o $(OBJ)/BDC_Test.o

# Executable
BDC_Test: $(BDCObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/BDC_Test $(BDCObjs)

# Make clean
clean:
	rm -rf $(OBJ)/* $(EXE)/* *.o

# Make all
all: JK_Test BDC_Test
