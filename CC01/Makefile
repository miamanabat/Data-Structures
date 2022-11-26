# Author: Mia Manabat
# E-mail: mmanabat@nd.edu
#
# This is the Makefile for Lab 02

# G++ is for the GCC compiler for C++
PP := g++

# CXXFLAGS are the compiler flages for when we compile C++ code in this course
FLAGS := -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm
CXXFLAGS := -m64 -std=c++11 -Weffc++ $(FLAGS)

# Command: make lucky
lucky.o: lucky.cpp ; $(PP) $(CXXFLAGS) -c lucky.cpp

lucky: lucky.o
	$(PP) $(CXXFLAGS) -o lucky lucky.o

# Command: make streams
streams.o: streams.cpp ; $(PP) $(CXXFLAGS) -c streams.cpp

streams: streams.o
	$(PP) $(CXXFLAGS) -o streams streams.o

# Command: make combine
combine.o: combine.cpp ; $(PP) $(CXXFLAGS) -c combine.cpp

combine: combine.o
	$(PP) $(CXXFLAGS) -o combine combine.o

# Make all
all : lucky streams

# Make clean
clean :
	rm -rf *.o lucky streams combine
