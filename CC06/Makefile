# G++ is for the GCC compiler for C++
PP := g++

# CXXFLAGS are the compiler flages for when we compile C++ code in this course 
FLAGS := -O0 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror
CXXFLAGS := -m64 -std=c++11 -Weffc++ $(FLAGS)

# Variables for Folders
INC := include
SRC := src
EXE := exe
OBJ := obj


# make initialize
# Will be called by grader to initialize your objects and executables folders
initialize: 
	rm -rf $(OBJ) $(EXE)
	mkdir $(OBJ) $(EXE)


# Make clean
clean :
	rm -rf $(OBJ)/* $(EXE)/*
	
	
# Command: make DHTest
DHTestObjs := $(OBJ)/DHTest.o 

DHTest: $(DHTestObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/DHTest $(DHTestObjs)

$(OBJ)/DHTest.o: $(SRC)/DHTest.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/DHTest.cpp -o $@


# Command: make QPTest
QPTestObjs := $(OBJ)/QPTest.o 

QPTest: $(QPTestObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/QPTest $(QPTestObjs)

$(OBJ)/QPTest.o: $(SRC)/QPTest.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/QPTest.cpp -o $@