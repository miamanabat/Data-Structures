#include "../inc/TrieNode.h"

#include <iostream>
#include <string>

#define COUT std::cout
#define ENDL std::endl
#define STRING std::string

void addString( TrieNode*& theNode, const std::string& word, unsigned int value ){
	
	// We haven't reach the end of the word
	if( value < word.size() ){
		
		TrieNode* nextLevel = &theNode->childNodes[ (unsigned int)word[value] ];
		
		// Add each character to the word
		if( !nextLevel->validLetter ){
			
			TrieNode temp(true);
			
			*nextLevel = temp;
			
		}
		
		addString( nextLevel, word, value + 1);
		
	}
	
	// If we have reached the end of the word
	else if( value == word.size() ){
		
		// Add a star indicating this is a valid word
		theNode->childNodes[ (unsigned int)'*' ].validLetter = true;
		
		// Do not create a subtree for '*'
		
		return;
	}
	
}


void printTriePreOrder( TrieNode* theNode, unsigned int level ){

	// If we've reached the end, return 
	if( theNode == NULL ){
		return;
	}
	
	// Otherwise, recursively call
	for(unsigned int iter = 0; iter < NumASCII; iter++){
		
		if( theNode->childNodes[iter].validLetter ){
		
			COUT << '{' << (char)iter << " - " << level << "} ";
		
			TrieNode* nextLevel = &theNode->childNodes[ iter ];
		
			printTriePreOrder( nextLevel, level + 1 );
			
		}
	}
	
}

int main(){
	
	// Create a root TrieNode
	// True allows for 128 bool children
	// But all those children will be empty Dynamic Arrays
	// Prevents run away recursion and segmentation faults
	TrieNode* root = new TrieNode(true);
	
	// Add the strings 
	addString(root, "AAAA", 0);
	addString(root, "ABA", 0);
	addString(root, "CAAA", 0);	
	addString(root, "CABB", 0);
	addString(root, "BACC", 0);
	addString(root, "BBCC", 0);
	addString(root, "BABB", 0);
		
	printTriePreOrder(root, 1);
	
	COUT << ENDL; 
	
	return 0;
}
