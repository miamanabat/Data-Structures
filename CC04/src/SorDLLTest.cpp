#include "../inc/DLList.h"

#include <iostream>
#include <cstdlib>

int main(int argc, char** argv){

    // If there are not enough inputs (2) exit
    if ( argc < 2 ){
        std::cout << "Incorrect number of inputs" << std::endl;
        exit(-1);
    }  

    // Initializing the two DLLs
    DLList<int> dll;
    DLList<int> dll_sorted;

    // Looping through the command line args
    for (int i = 1; i < argc; i++){

        // calls to Insert and SortInsert to fill DLLs
        dll.Insert(atoi(argv[i]));
        dll_sorted.SortInsert(atoi(argv[i]));

    }

    // Print the DLLs
    std::cout << dll << std::endl;
    std::cout << dll_sorted << std::endl;


	return 0;
	
}
