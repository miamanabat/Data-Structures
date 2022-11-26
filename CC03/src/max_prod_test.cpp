/* Name: Mia Manabat
 * Email: mmanabat@nd.edu
 * File: max_prod_test.cpp
 */

#include "../inc/max_prod.h"

int main(int argc, char** argv){

    // check num of inputs
    if (argc < 2){
        COUT << "Incorrect number of inputs" << ENDL;
        exit(-1);
    }


    // creating vector of ints from argv
    VECTOR<int> the_vec;

    for (int i = 1; i < argc; i++){

        the_vec.push_back(atoi(argv[i]));

    }

    // call to max product function and output
    COUT << max_prod(the_vec) << ENDL;

    return 0;
}
