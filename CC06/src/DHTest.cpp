#include <iostream>
#include <cstdlib>
#include "../inc/DoubleHash.h"

#define COUT std::cout
#define ENDL std::endl

int main( int argc, char** argv ){
	
	if( argc < 2 ){
		
		COUT << "Incorrect number of inputs" << ENDL;
		exit(-1);
		
	}
	
	HashTable< int, int > the_LP_Hash;
	DoubleHash< int, int > the_Double_Hash;
	
	for( int iter = 1; iter < argc; ++iter ){
		
		int key = atoi( argv[iter] );
		
		int value = key * 10 - 7;
		
		the_LP_Hash.insert( { key, value } );
		
		the_Double_Hash.insert( { key, value } );
		
	}
	
	COUT << "Linear Probe Hash:" << ENDL;
	COUT << the_LP_Hash << ENDL;
	
	COUT << "Double Hash:" << ENDL;
	COUT << the_Double_Hash << ENDL;
	
	return 0;
}
