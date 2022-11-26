# This is the Makefile for the CSE 20312 course - Lab 06

# G++ is for the GCC compiler for C++
PP := g++

# CXXFLAGS are the compiler flages for when we compile C++ code in this course 
FLAGS := -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror
CXXFLAGS := -m64 -std=c++11 -Weffc++ $(FLAGS)

# Variables for Folders
INC := inc
SRC := src
EXE := exe
OBJ := obj


# Command: make SortKLists - Find Kth Largest
SortKListsObjs := $(OBJ)/SortKLists.o 

SortKLists: $(SortKListsObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/SortKLists $(SortKListsObjs)
	$(EXE)/./SortKLists

$(OBJ)/SortKLists.o: $(SRC)/SortKLists.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/SortKLists.cpp -o $@
	



# make initialize
# Will be called by grader to initialize your objects and executables folders
initialize: 
	mkdir $(OBJ) $(EXE)
	

# Make clean
clean :
	rm -rf $(OBJ)/* $(EXE)/*
