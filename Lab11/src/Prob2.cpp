#include <iostream>
#include <fstream>

#define CIN std::cin
#define COUT std::cout
#define ENDL std::endl
#define OFSTREAM std::ofstream


int main(){
	
	// Create the output stream 
	OFSTREAM file_out( "Prob2.txt" );
	
	while( true ) {

		COUT << "Problem 2: Given a bloom filter with a desired error rate of 0.125% that needs to represent 500 values, select the correct number of bits required in the bitset and required number of hash functions (Closest approximation)" << ENDL;
		COUT << ENDL;
		COUT << "Solutions presented as: { Bitset Size, hash functions }" << ENDL;
		
		COUT << "A: {1443, 3}" << ENDL;
		COUT << "B: {2164, 3}" << ENDL;
		COUT << "C: {1500, 4}" << ENDL;
		COUT << "D: {1443, 4}" << ENDL << ENDL;
		COUT << ENDL;
		
		char stu_answer;
		
		COUT << "Enter your choice (Like Linux, answer is case sensitive): ";
		CIN >> stu_answer;
		
		if( stu_answer == 'B' ){
			COUT << "Correct Answer!" << ENDL;
			COUT << "Completion towards Lab 11 Assignment" << ENDL;
			break;
		}
		
		else{
			COUT << "Incorrect choice. Please try again." << ENDL;
		}
		
	}

	file_out << "Student successfully answered Problem 1 correctly in class." << ENDL;

	// Close the file 
	file_out.close();	
	
	
}
