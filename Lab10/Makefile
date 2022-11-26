# This is the Makefile for the CSE 20312 course - Lecture 26

# G++ is for the GCC compiler for C++
PP := g++

# CXXFLAGS are the compiler flages for when we compile C++ code in this course 
FLAGS := -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror 
CXXFLAGS := -m64 -std=c++11 -Weffc++ $(FLAGS) 

# Variables for Folders
INC := include
SRC := src
EXE := exe
OBJ := obj


# Command: make Prob1
# Initial Examples of Trie Node
Prob1Objs := $(OBJ)/Prob1.o 

Prob1: $(Prob1Objs)
	$(PP) $(CXXFLAGS) -o $(EXE)/Prob1 $(Prob1Objs)
	$(EXE)/./Prob1

$(OBJ)/Prob1.o: $(SRC)/Prob1.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/Prob1.cpp -o $@


# Command: make TrieNodeTest
# Initial Examples of Trie Node
TrieNodeTestObjs := $(OBJ)/TrieNodeTest.o 

TrieNodeTest: $(TrieNodeTestObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/TrieNodeTest $(TrieNodeTestObjs)
	$(EXE)/./TrieNodeTest

$(OBJ)/TrieNodeTest.o: $(SRC)/TrieNodeTest.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/TrieNodeTest.cpp -o $@


# Command: make TrieNode2
# Initial Examples of Trie Node
TrieNode2Objs := $(OBJ)/TrieNode2.o 

TrieNode2: $(TrieNode2Objs)
	$(PP) $(CXXFLAGS) -o $(EXE)/TrieNode2 $(TrieNode2Objs)
	$(EXE)/./TrieNode2

$(OBJ)/TrieNode2.o: $(SRC)/TrieNode2.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/TrieNode2.cpp -o $@


# Command: make TrieTest
# Initial Examples of Trie Node
TrieTestObjs := $(OBJ)/TrieTest.o 

TrieTest: $(TrieTestObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/TrieTest $(TrieTestObjs)
	$(EXE)/./TrieTest

$(OBJ)/TrieTest.o: $(SRC)/TrieTest.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/TrieTest.cpp -o $@



# Command: make WordBreak
WordBreakObjs := $(OBJ)/WordBreak.o 

WordBreak: $(WordBreakObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/WordBreak $(WordBreakObjs)
	$(EXE)/./WordBreak $(SRC)/Dictionary.txt

$(OBJ)/WordBreak.o: $(SRC)/WordBreak.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/WordBreak.cpp -o $@


# Command: make WordSearch
WordSearchObjs := $(OBJ)/WordSearch.o 

WordSearch: $(WordSearchObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/WordSearch $(WordSearchObjs)
	$(EXE)/./WordSearch $(SRC)/Dictionary.txt

$(OBJ)/WordSearch.o: $(SRC)/WordSearch.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/WordSearch.cpp -o $@
	

# Initialize 
initialize:
	mkdir $(OBJ) $(EXE)

# Make all
all: testPQ testBH

# Make clean
clean :
	rm -rf *.o $(OBJ)/* $(EXE)/*
