/*
  File: JK_Test.cpp
  Author: Mia Manabat
  Email: mmanabat@nd.edu
*/

#include "../inc/JKFF.h"
#include <iostream>
#include <fstream>
#define COUT std::cout
#define ENDL std::endl
#define IFSTREAM std::ifstream

// Reads in values from a text stream to input into the flip flop
void readValues(std::istream& input, JKFF flip_flop){
    bool J;
    bool K;
    bool CLK;

    while (input >> CLK >> J >> K){

        flip_flop.updateVals(CLK, J, K);

        COUT << flip_flop.getQ() << " " << flip_flop.getQbar() << ENDL;
        
    }
}


int main(int argc, char** argv){

    // checking number of arguments
    if (argc != 2){
        COUT << "Incorrect number of inputs" << ENDL;
        exit(-1);
    }

    // checking whether input stream is valid
    IFSTREAM read_in(argv[1]);

    if (!read_in){
        COUT << argv[1] << " does not exist" << ENDL;
        exit(-1);
    }

    // Creating the flip flop
    JKFF flip_flop;

    // Calling the function to read the text stream
    readValues(read_in, flip_flop);

    // Closing the file
    read_in.close();

    return 0;
}
