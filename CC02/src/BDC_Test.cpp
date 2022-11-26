/*
  File: BDC_Test.cpp
  Author: Mia Manabat
  Email: mmanabat@nd.edu
*/

#include "../inc/BDC.h"
#include <iostream>
#include <fstream>
#define COUT std::cout
#define ENDL std::endl
#define IFSTREAM std::ifstream

void readValues(std::istream& input, BDC& bdc){

    bool CLK;
    bool up_down;

    while (input >> CLK >> up_down){

        bdc.count(CLK, up_down);
        COUT << bdc << ENDL;
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


    BDC bdc;
    COUT<< "Initial value in main: " << bdc << ENDL;
    readValues(read_in, bdc);
    COUT << "Final value in main: " << bdc << ENDL;

    read_in.close();

    return 0;
}
