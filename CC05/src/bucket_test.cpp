#include "../inc/bucket_sort.h"

int main( int argc, char** argv ){
	
	if( argc < 2 ){
		
		COUT << "Incorrect number of inputs" << ENDL;
		exit(-1);
	}
	
	
	VECTOR< int > sort_vec;
	
	for( int iter = 1; iter < argc; ++ iter ){
		
		sort_vec.push_back( atoi( *( argv + iter) ) );
		
	}

	// Sort and Print the values
	bucket_sort_func( sort_vec );
	
	return 0;
	
}