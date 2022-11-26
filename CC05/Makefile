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
	
	
# Command: make quick_test
quick_testObjs := $(OBJ)/quick_test.o 

quick_test: $(quick_testObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/quick_test $(quick_testObjs)

$(OBJ)/quick_test.o: $(SRC)/quick_test.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/quick_test.cpp -o $@


# Command: make bucket_test
bucket_testObjs := $(OBJ)/bucket_test.o 

bucket_test: $(bucket_testObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/bucket_test $(bucket_testObjs)

$(OBJ)/bucket_test.o: $(SRC)/bucket_test.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/bucket_test.cpp -o $@