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

		COUT << "Problem 1: Given the following words, select the final pre-order traversal of the corresponding Trie data structure:" << ENDL;
		COUT << ENDL;
		COUT << "{AAA, ABA, CAA, CAB, BAC, BBC, BAB}" << ENDL;
		
		COUT << "A: \n{A - 1} {A - 2} {A - 3} {B - 2} {A - 3}{B - 1} {A - 2} {B - 3}  {C - 3}  {B - 2} {C - 3} {C - 1} {A - 2} {A - 3} {B - 3}" << ENDL;
		COUT << "B: \n{A - 1} {A - 2} {* - 3} {B - 2} {A - 3} {* - 4} {B - 1} {A - 2} {B - 3} {* - 4} {C - 3} {* - 4} {B - 2} {* - 3} {C - 1} {A - 2} {A - 3} {* - 4} {B - 2} {* - 3}" << ENDL;
		COUT << "C: \n{A - 1} {A - 2} {A - 3} {* - 4} {B - 2} {A - 3} {* - 4} {B - 1} {A - 2} {B - 3} {* - 4} {C - 3} {* - 4} {B - 2} {C - 3} {* - 4} {C - 1} {A - 2} {A - 3} {* - 4} {B - 3} {* - 4}" << ENDL;
		COUT << "D: \n{A - 1} {A - 2} {A - 3} {A - 4} {* - 5} {B - 2} {A - 3} {* - 4} {B - 1} {A - 2} {B - 3} {B - 4} {* - 5} {C - 3} {C - 4} {* - 5} {B - 2} {C - 3} {C - 4} {* - 5} {C - 1} {A - 2} {A - 3} {A - 4} {* - 5} {B - 3} {B - 4} {* - 5}" << ENDL << ENDL;
		COUT << ENDL;
		
		char stu_answer;
		
		COUT << "Enter your choice (Like Linux, answer is case sensitive): ";
		CIN >> stu_answer;
		
		if( stu_answer == 'C' ){
			COUT << "Correct Answer!" << ENDL;
			COUT << "Completion towards Lab 10 Assignment" << ENDL;
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
