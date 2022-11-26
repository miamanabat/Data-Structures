#include "../inc/PriorityQueue.h"
#include "../inc/Printer.h"

#include <fstream>

#define COUT std::cout
#define ENDL std::endl

int main(int argc, char** argv){

    // If there are more or less than two inputs, exit
    if ( argc != 2 ){
        std::cout << "Incorrect number of inputs" << std::endl;
        exit(-1);
    }  

    // Check whether input stream is valid
    std::ifstream read_in(argv[1]);

    if ( !read_in ) {

        std::cout << argv[1] << " does not exist" << std::endl;
        exit(-1);

    }

    // Initializing the Priority Queue
    PriorityQueue<Printer> pq;

    unsigned int pages;
    STRING job;
    // Reading in values
    while ( read_in >> pages >> job ){

        Printer printer( pages, job );

        pq.push(printer);
        
    }

    // Close file
    read_in.close();

    // while the queue is not empty, print and pop
    while ( !pq.empty() ){

        std::cout << pq.top() << std::endl;
        pq.pop();

    }

    std::cout << std::endl;

	return 0;
}

