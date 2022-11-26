#include "../inc/quick_sort.h"

int main( int argc, char** argv ){
	
	if( argc < 2 ){
		
		COUT << "Incorrect number of inputs" << ENDL;
		exit(-1);
	}
	
	VECTOR< int > sort_vec;
	
	for( int iter = 1; iter < argc; ++ iter ){
		
		sort_vec.push_back( atoi( *( argv + iter) ) );
		
	}
	
	// Print the values
	print_vec_func( sort_vec );
	
	// Randomly Shuffle the values
	std::random_shuffle( sort_vec.begin(), sort_vec.end() );
	
	// Sort the values - Initial pass
	quick_sort_func( sort_vec, 0, (int)( sort_vec.size() - 1 ) );
	
	// Print the values
	print_vec_func( sort_vec );
	
	return 0;
	
}
