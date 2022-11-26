// Name: Mia Manabat
// Email: mmanabat@nd.edu
// CC01: streams.cpp

#include <iostream>
#include <fstream>
#include <string>

#define IFSTREAM std::ifstream
#define STRING std::string
#define COUT std::cout
#define ENDL std::endl

int reverse(IFSTREAM& read_in, unsigned int file_number){
	// base case
	if (file_number == 0){
		return 0;
	}

	// extract the first word
	STRING word;
	read_in >> word;

	// recursive call
	reverse(read_in, file_number - 1);

	// word displayed
	COUT << word << ENDL;

	return 0;
}

int main(int argc, char** argv) {
	//check for the right num of inputs
	if (argc != 2){
		COUT << "Incorrect number of inputs." << ENDL;
		return 0;
	}

	// create the file stream
	IFSTREAM read_in(argv[1]);

	//check to ensure file exists
	if (!read_in){
		COUT << "Invalid file." << ENDL;
		return 0;
	}

	// read the number from the file
	unsigned int file_number;

	// check that there is an int in the file
	if (!(read_in >> file_number)){
		COUT << "File requires an initial integer." << ENDL;
		return 0;
	}

	// call to recursive function
	reverse(read_in, file_number);

	// close file streams
	read_in.close();

	return 0;
}
