// Name: Mia Manabat
// Email: mmanabat@nd.edu
// CC01: combine.cpp

#include <iostream>
#include <fstream>
#include <vector>

#define OFSTREAM std::ofstream
#define ENDL std::endl
#define COUT std::cout
#define VECTOR std::vector

// recursive function for file output
int sum_nums(OFSTREAM& read_out, VECTOR<int>& the_vector, int input_number){
  // base case
  if (input_number == 0){
    return 0;
  }

  // recursive call- index shifted by 1
  the_vector.at(input_number - 1) = sum_nums(read_out, the_vector, input_number - 1) +
                                input_number;

  read_out << the_vector.at(input_number - 1) << ENDL;

  return the_vector.at(input_number - 1);
}


int main(int argc, char** argv) {
	//check for the right num of inputs
	if (argc != 2){
		COUT << "Incorrect number of inputs." << ENDL;
		return 0;
	}

  // read in integer from command line
  int input_number(atoi(argv[1]));

  // create vector with length of input_number
  VECTOR<int> the_vector(input_number);

	// create the file stream
	OFSTREAM read_out("vec_output.txt");

	// call to recursive function
	sum_nums(read_out, the_vector, input_number);

	// close files
	read_out.close();

	return 0;
}
