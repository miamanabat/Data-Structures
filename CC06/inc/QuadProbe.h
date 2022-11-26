#ifndef QUADPROBE_H
#define QUADPROBE_H

#include "LinearProbe.h"
template< class Key, class Value >
class QuadProbe : public HashTable<Key, Value> {

	private:	

		// overridden method findPos for doing the quad probe
		long unsigned int findPos( const Key& theKey ) const{

			// current position is key mod size of table
			long unsigned int currentPos = this->HashFunc(theKey) % this->array.capacity();
			long unsigned int iter = 0;
			double constant1 = .5;
			double constant2 = .5;

			do {

				// intermediate values for calculating currentPos
				// (currPos + const1 * iter + const2 * iter^2) % table size
				double add_iter = constant1 * (double)iter;
				double add_iter_squared = constant2 * double(iter * iter);
				long unsigned int curr_and_doubles = currentPos + (long unsigned int) (add_iter + add_iter_squared);
				
				currentPos = curr_and_doubles % this->array.capacity();

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

		QuadProbe( const unsigned int size = 0 ) 
			: HashTable<Key, Value>(size) {}
				
		~QuadProbe() {}


		friend std::ostream& operator<<( std::ostream& output, const QuadProbe<Key, Value>& theTable ){
			
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
