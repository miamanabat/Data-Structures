#include "../inc/PriorityQueue.h"

#include <iostream>
#include <cstdlib>

#define COUT std::cout
#define ENDL std::endl

int main(int argc, char** argv){

    // If there are not enough inputs (2) exit
    if ( argc < 2 ){
        std::cout << "Incorrect number of inputs" << std::endl;
        exit(-1);
    }  

    // Initializing the PriorityQueue
    PriorityQueue<int> pq;

    // Looping through the command line args
    for (int i = 1; i < argc; i++){

        // calls to Insert and SortInsert to fill PriorityQueue
        pq.push(atoi(argv[i]));
        
    }

    // while the queue is not empty, print and pop
    while ( !pq.empty() ){

        std::cout << pq.top() << " ";
        pq.pop();

    }

    std::cout << std::endl;

	return 0;
}
