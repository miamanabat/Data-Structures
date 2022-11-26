#ifndef TRIENODE_H
#define TRIENODE_H

#include "DynArr.h"
#include <iostream>
#include <string>

#define COUT std::cout
#define ENDL std::endl
#define STRING std::string

static const int NumASCII = 128;

struct TrieNode{

	// Part 1 - Members and Constructors
	bool validLetter;
	DynArr< TrieNode > childNodes;

	// Default constructor - It is a leaf, and the child dynamic array is empty
	TrieNode() : validLetter(false), childNodes(0) {}
	
	// Constructor with char input - It is not a lead, and the child dynamic array has 128 values
	TrieNode(bool charInVal) : validLetter(charInVal), childNodes(NumASCII) {}
	
	// Part 2 - Add a Child Character
	void addChild( char childChar ){

		if( !childNodes[ (unsigned int)childChar ].validLetter ){
			
			TrieNode temp( true );
			
			childNodes[ (unsigned int)childChar ] = temp;
		}

	}

	
	// Part 3 - Get the address of the specific pointer child, or NULL if not true
	TrieNode* getChildPtr( char childChar ){
		
		if( childNodes[ (unsigned int)childChar].validLetter  ){
			
			return &childNodes[ (unsigned int)childChar ];
		}
		
		// If it gets here, there was no child 
		return NULL;
		
	}

};

#endif