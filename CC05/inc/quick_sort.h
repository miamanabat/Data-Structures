#ifndef QUICK_SORT_H
#define QUICK_SORT_H

#include <vector>
#include <iostream>
#include <algorithm> // for std::random_shuffle ONLY

#define COUT std::cout
#define ENDL std::endl
#define VECTOR std::vector

template< class T >
void print_vec_func( const VECTOR< T >& print_vec ){
	
    for( int curr_val : print_vec ){
        
        COUT << curr_val << " ";
        
    }
	
	COUT << ENDL;
}

template<class T>
void swap( T& first, T& second ){
	
	// Swap the values
	T temp = first;
	first = second;
	second = temp;
	
}

template<class T>
int partition( VECTOR< T >& sort_vec, int min, int max ){

	// initial values
	int partition = min;
	int left = min + 1;
	int right = max;

	
	while (true){
	
		// While value at left is less than value at partition, increment left
		while (sort_vec.at(left) < sort_vec.at(partition)){
			left++;
			
			if (left == max){
				break;
			}
		}

		// While value at partition is less than the value at right, decrement right
		while (sort_vec.at(partition) < sort_vec.at(right)){
			right--;

			if (right == min){
				break;
			}
		}	

		// If pointers cross, break the while loop
		if (left >= right){
			break;
		}
		// Otherwise, swap left and right values if the value at left is greater than the value at right
		else if (sort_vec.at(left) > sort_vec.at(right)){
			swap(sort_vec.at(left), sort_vec.at(right));
			
		}
	}

	//If the value at partition is bigger than the value at right, swap
	if (sort_vec.at(partition) > sort_vec.at(right)){

		swap(sort_vec.at(partition), sort_vec.at(right));
	}
	
	// return the right value
	return right;

}


template<class T>
void quick_sort_func( VECTOR< T >& sort_vec, int min, int max ){

	// If the vector size is 0 or max is less than or equal to min, return
	if (sort_vec.size() == 0 || max <= min){
		return;
	}
	
	// If max is one greater than min, and the value at min is greater than at max, swap
	if (max - 1 == min && sort_vec.at(min) > sort_vec.at(max)){
		swap(sort_vec.at(min), sort_vec.at(max));
	}

	// Get the partition
	int partition_int = partition(sort_vec, min, max);

	// Left recursive call
	quick_sort_func(sort_vec, min, partition_int - 1);

	// Right recursive call
	quick_sort_func(sort_vec, partition_int + 1, max);

}

#endif
