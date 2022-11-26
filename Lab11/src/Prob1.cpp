#include <iostream>
#include <fstream>

#define CIN std::cin
#define COUT std::cout
#define ENDL std::endl
#define OFSTREAM std::ofstream


int main(){
	
	// Create the output stream 
	OFSTREAM file_out( "Prob1.txt" );
	
	while( true ) {

		COUT << "Problem 1: Given a bloom filter with 8 bits with two hash functions:" << ENDL;
		COUT << "k1 = ( 13 - (x % 13) )% 8" << ENDL;
		COUT << "k2 = (3 + 5x) % 8" << ENDL;
		COUT << "Show the results for inserting 221 and 383:" << ENDL;
		
		COUT << "A: 0 0 0 0 1 1 1 1" << ENDL;
		COUT << "B: 0 0 0 0 1 1 0 1" << ENDL;
		COUT << "C: 0 1 0 0 1 0 1 1" << ENDL;
		COUT << "D: 0 1 1 0 0 0 1 1" << ENDL << ENDL;
		
		char stu_answer;
		
		COUT << "Enter your choice (Like Linux, answer is case sensitive): ";
		CIN >> stu_answer;
		
		if( stu_answer == 'A' ){
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
