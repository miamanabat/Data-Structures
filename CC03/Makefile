# Author: Mia Manabat
# Email: mmanabat@nd.edu
#
# This is the Makefile for Coding Challenge 03

# G++ is the GCC compiler for C++
PP := g++

# CFLAGS are the compiler flags for when we compile C++ code in this course
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
$(OBJ)/decode_sol.o: $(SRC)/decode_sol.cpp
		$(PP) $(CXXFLAGS) -c $(SRC)/decode_sol.cpp -o $@ 

# Creating the object files and placing them in the objects folder
$(OBJ)/decode.o: $(SRC)/decode.cpp
		$(PP) $(CXXFLAGS) -c $(SRC)/decode.cpp -o $@ 

# Creating the object files and placing them in the objects folder
$(OBJ)/max_prod_test.o: $(SRC)/max_prod_test.cpp
		$(PP) $(CXXFLAGS) -c $(SRC)/max_prod_test.cpp -o $@ 

# Creating the object files and placing them in the objects folder
$(OBJ)/max_prod.o: $(SRC)/max_prod.cpp
		$(PP) $(CXXFLAGS) -c $(SRC)/max_prod.cpp -o $@ 


# Object list
DecodeObjs := $(OBJ)/decode_sol.o $(OBJ)/decode.o

MaxProdObjs := $(OBJ)/max_prod_test.o $(OBJ)/max_prod.o

# Executable
decode_sol: $(DecodeObjs)
		$(PP) $(CXXFLAGS) -o $(EXE)/decode_sol $(DecodeObjs)

max_prod_test: $(MaxProdObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/max_prod_test $(MaxProdObjs)

# Make clean
clean: 
		rm -rf  $(OBJ)/* $(EXE)/*

# Make all
all: decode_sol max_prod_test
