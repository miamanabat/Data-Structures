#include "../inc/AlienSol.h"

int main(){
	
	DynArr < STRING > words;

	words.push_back( "eftt" );	
	words.push_back( "wer" );
	words.push_back( "wt" );
	words.push_back( "wrf" );
	words.push_back( "ett" );
	words.push_back( "er" );
	
	COUT << "Alien Words: ";
	for( unsigned int iter = 0; iter < words.size(); iter++ ){
		
		COUT << words[ iter ] << " ";
	}
	
	COUT << ENDL << ENDL;
	
	// Create the character Graph to solve the problem
	Graph< char > AlienLanguage;
	
	// Pair the character with its parent
	DynArr< std::pair<char, int> > parents; 
	
	// Run the Algorithm
	AlienGraphSol( AlienLanguage, words, parents );
	
	
	// Print the results
	printGraphSol( parents );
	
	return 0;
	
	
}
