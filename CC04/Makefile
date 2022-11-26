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
	
	
# Command: make SorDLLTest
SorDLLTestObjs := $(OBJ)/SorDLLTest.o 

SorDLLTest: $(SorDLLTestObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/SorDLLTest $(SorDLLTestObjs)

$(OBJ)/SorDLLTest.o: $(SRC)/SorDLLTest.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/SorDLLTest.cpp -o $@


# Command: make PQTest
PQTestObjs := $(OBJ)/PQTest.o 

PQTest: $(PQTestObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/PQTest $(PQTestObjs)

$(OBJ)/PQTest.o: $(SRC)/PQTest.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/PQTest.cpp -o $@
	
	
# Command: make PrinterTest

$(OBJ)/PrinterTest.o: $(SRC)/PrinterTest.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/PrinterTest.cpp -o $@

$(OBJ)/Printer.o: $(SRC)/Printer.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/Printer.cpp -o $@

PrinterTestObjs := $(OBJ)/PrinterTest.o $(OBJ)/Printer.o 

PrinterTest: $(PrinterTestObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/PrinterTest $(PrinterTestObjs)