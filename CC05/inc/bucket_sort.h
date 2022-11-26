#ifndef BUCKET_SORT_H
#define BUCKET_SORT_H

#include "quick_sort.h"

#include <unordered_map>


int int_hash( int input ){
	
	return input / 10;	
	
}

template<class T>
void bucket_sort_func( VECTOR< T >& sort_vec ){
	
	// Part 5 begins here
	
	// Create an unordered_map where the key is int, the value is a vector of type T
	std::unordered_map<int, VECTOR<T>> the_map;

	// Iterate through the sort_vec
	for (T current : sort_vec){

		// Set the key to the current value in the vector's hash result with int_hash
		the_map[int_hash(current)].push_back(current);

	}

	// Loop that iterates from 0 to 9 for the buckets; sorting each bucket
	for (int i = 0; i <= 9; i++){
		
		// Pass the vector from the hash to quick sort
		quick_sort_func(the_map[i], 0, (int)the_map[i].size() - 1);
	}
		
	// Loop that iterates from 0 to 9 for the buckets; printing the elements in order
	for (int i = 0; i <= 9; i++){
		
		// Loop through each element in the hash[key=i]
		for (T current : the_map[i]){

			// Print out value
			COUT << current << " ";
		}
	}

	// Print new line
	COUT << ENDL;
	
}

#endif
