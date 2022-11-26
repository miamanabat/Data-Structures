#ifndef TRIE_H
#define TRIE_H

#include "TrieNode.h"

class Trie{
	
	private:
	
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
		
		
		bool contains( TrieNode* theNode, const std::string& word, unsigned int value ) const {
			
			/* Part 5 goes here */
			if( value < word.size() ){
				
				TrieNode* nextLevel = &theNode->childNodes[ (unsigned int)word[value] ];	
				
				if( nextLevel->validLetter ){
					
					return contains( nextLevel, word, value + 1);
					
				}
				else{
					
					return false;
				}

			}
			
			// If we have reached the end of the word
			//else if( value == word.size() ){
			else{
				// Add a star indicating this is a valid word
				return theNode->childNodes[ (unsigned int)'*' ].validLetter;
				
			}			

			
		}

	
		TrieNode* root;
	
	public:
	
		Trie() : root( new TrieNode(true) ) {}
		
		void addString( const std::string& word ){
			
			addString( root, word, 0 );
			
		}
		
		
		void printTriePreOrder( ){
			
			printTriePreOrder(root, 1);
			
		}
		
		
		bool contains( const std::string& word ) const{
			
			return contains( root, word, 0 );
			
		}
	
};

#endif