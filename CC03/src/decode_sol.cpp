/* Name: Mia Manabat
 * Email: mmanabat@nd.edu
 * File: decode_sol.cpp
 */ 

#include "../inc/decode.h"

int main(int argc, char** argv){

    // check for num of inputs
    if (argc < 2){
        COUT << "Incorrect number of inputs" << ENDL;
        exit(-1);
    }

    // making string from argv[1] 
    STRING str(argv[1]);

    // call to decode the string and output
    COUT << decode(str) << ENDL;

    return 0;
}
