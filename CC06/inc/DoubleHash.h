#ifndef DOUBLEHASH_H
#define DOUBLEHASH_H

#include "LinearProbe.h"

template< class Key, class Value >
class DoubleHash : public HashTable<Key, Value> {

	private:	

		// private method for performing the second hash
		long unsigned int HashFunc2( const int& key ) const {
	
			// if the key is negative, convert to positive first
			if (key < 0){
				return (long unsigned int)(3 - (key * -1) % 3);
			}
			
			// return the double hash result 
			return (long unsigned int) (3 - key % 3);

		}

		// overridden method findPos for the double hashing
		long unsigned int findPos( const Key& theKey ) const{

			long unsigned int currentPos = this->HashFunc(theKey) % this->array.capacity();
			long unsigned int iter = 0;

			do {
				// Determine currentPos with calculated pos + second hash result times the iter
				currentPos = (currentPos + HashFunc2( theKey )*iter) % this-> array.capacity();

				++iter;
			}
			while(
				this->array.at( currentPos ).state != EMPTY
				&& this->array.at( currentPos ).state != DELETED
				&& this->array.at( currentPos ).key != theKey
				&& iter < this->array.capacity()
			);

			// return capacity if the current value isn't the key. For safety
			if (this->array.at( currentPos ).state == ACTIVE
					&& this->array.at( currentPos ).key != theKey ){
				return this->array.capacity();
			}

			return currentPos;
		}

	public:

		DoubleHash( const unsigned int size = 0 ) 
			: HashTable<Key, Value>(size) {}
				
		~DoubleHash() {}


		friend std::ostream& operator<<( std::ostream& output, const DoubleHash<Key, Value>& theTable ){
			
			output << "Hash Table Size: " << theTable.array.size() << std::endl;
			output << "Hashed Elements: " << theTable.numHash << std::endl;
			
			for(unsigned int iter = 0; iter < theTable.array.size(); iter++){
				
				output << "{" << iter << ": ";
				
				if( theTable.array[iter].state == ACTIVE ){
				
					output << "ACTIVE, ";
				
				}
				else if( theTable.array[iter].state == DELETED ){
				
					output << "DELETED, ";
				
				}
				else{
					
					output << "EMPTY, ";
				}
				
				output << theTable.array[iter].key << ", ";
				
				output << theTable.array[iter].value << "}" << std::endl;
				
			}
			
			return output;
		}



};

#endif
