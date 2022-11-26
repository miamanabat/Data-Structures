#include <bitset>
#include <iostream>
#include <fstream>
#include <vector>

#define COUT std::cout
#define ENDL std::endl
#define OFSTREAM std::ofstream
#define BITSET std::bitset
#define VECTOR std::vector

/********************************************
* Function Name  : printBitset
* Pre-conditions : BITSET<bitsetsize>& bitSums
* Post-conditions: none
* 
* Prints the bitset to the user 
********************************************/
template <size_t bitsetsize>
void printBitset(BITSET<bitsetsize>& bitSums){
	
	for(int iter = 0; iter < bitsetsize; ++iter){
		std::cout << bitSums[iter] << "|";
	}
	std::cout << std::endl;
	
}
 
/********************************************
* Function Name  : subsetSum
* Pre-conditions : BITSET<bitsetsize>& bitSums, const int arrNums[], int n
* Post-conditions: none
*
* Creates a bitset with all possible sums  
********************************************/

/* Problem 3 Starts Here */
// Recall you must template to the bitsetsize
template<size_t bitsetsize>
void subsetSum(BITSET<bitsetsize>& bitSums, const VECTOR<int>& vecNums ) {
	// set all the bits to 0
	bitSums.reset();

	// set the 0th bit because subset sum of 0 exists
	bitSums[0] = 1;

	std::cout <<"Bitset after inserting 0 sum:" << std::endl;

	printBitset(bitSums);

	// apply the same technique as explained above
	for (long unsigned int iter = 0; iter < vecNums.size(); ++iter){
		// shifts the bitset vecNums.at(iter) places
		bitSums |= (bitSums << vecNums.at(iter));

		COUT << "Bitset after iteration " << iter + 1;
		COUT << " for value " << vecNums.at(iter) <<":" << ENDL;

		printBitset(bitSums);
	}

	COUT <<ENDL;
}


/********************************************
* Function Name  : printBitCheck
* Pre-conditions : BITSET<bitsetsize>& bitSums, size_t n
* Post-conditions: none
* 
* Prints the Bitset with the element we are searching for 
* highlighted with a *1* ot *0* 
********************************************/
template <size_t bitsetsize>
void printBitCheck( BITSET<bitsetsize>& bitSums, size_t n ){
	
	for(int iter = 0; iter < bitsetsize; ++iter){
		
		if(iter == n)
			std::cout << "*";
		
		std::cout << bitSums[iter];
		
		if(iter == n)
			std::cout << "*";
		
		std::cout << "|";
	}
	std::cout << std::endl;
	
}

/********************************************
* Function Name  : checkValue
* Pre-conditions : int n, BITSET<bitsetsize> bitSums
* Post-conditions: none
* 
* Checks the bitset to determine whether a subset sum equal 
* to n exists in the array or not 
********************************************/

template <size_t bitsetsize>
void checkValue(int n, BITSET<bitsetsize> bitSums)
{ 

/* Problem 3 - Continues Here */
	if (n < 0){
		std::cout << n << " is less than 0, which is not a valid sum" << std::endl;
		return;
	}	

	if (n >= bitsetsize){
		std::cout << n << " is bigger than the largest possible sum" << std::endl;
		return;
	}

	std::cout << "subset sum of " << n;
	if (bitSums[n])
		std::cout << " exists\n";
	else
		std::cout << " does not exist\n";

	printBitCheck(bitSums, n);

}

/********************************************
* Function Name  : printArray
* Pre-conditions : const VECTOR<int>& vecNums
* Post-conditions: none
* 
* Print the initial Array Header to the user 
********************************************/
void printArray( const VECTOR<int>& vecNums ){
	
	COUT << "Initial array of size " << vecNums.size() << ": ";
	
	for(long unsigned int iter = 0; iter < vecNums.size(); ++iter){
		
		COUT << vecNums.at( iter ) << " ";
		
	}
	COUT << ENDL << ENDL;
}
 
/********************************************
* Function Name  : main
* Pre-conditions : void
* Post-conditions: int
* 
* Main Driver function 
********************************************/
int main()
{
	
	// Create the output stream 
	OFSTREAM file_out( "Prob3.txt" );	
	
	std::cout << "Determine if the sum of any subset of elements in an array is equal to a value" << std::endl;
	VECTOR<int> vecNums{ 4, 1, 10, 8, 5 };
	
	// Must do maxSum instead of writing a function since it must be 
	// a known value at compile time (28 + 1)
	const int maxSum = 29;
 
	// a vector of maxSum number of bits	
	BITSET< maxSum > bitSums;
	
	// Print the array to the user
	printArray( vecNums );
	
	// Create a bitset with the sum of all elements 
	subsetSum( bitSums, vecNums );

	// Test Cases
	std::cout << "Test cases for the function." << std::endl;
	checkValue(-1, bitSums);
	checkValue(2, bitSums);
	checkValue(5, bitSums);	 	
	checkValue(6, bitSums);	 	
	checkValue(7, bitSums);	 	
	checkValue(16, bitSums);	 
	checkValue(24, bitSums);
	checkValue(28, bitSums);
	checkValue(43, bitSums);
	
	file_out << "Student successfully answered Problem 3 correctly in class." << ENDL;

	// Close the file 
	file_out.close();	
	 
	return 0;
}
