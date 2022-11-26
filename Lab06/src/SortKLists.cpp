#include "../inc/DLList.h"
#include "../inc/MaxHeap.h"
#include "../inc/DynArr.h"
#include <ctime>

#define COUT std::cout
#define ENDL std::endl

const long unsigned int MAXLISTS = 20;
const long unsigned int MAXVALS = 50;

/* Put the SortKLists Method Here */ 
DLList< int > SortKLists(DynArr< DLList< int > >& kSortedLists ) {

	// Create a Max Heap
	MaxHeap<int> theHeap;

	//Iterate through each Doubly Linked List
	for (long unsigned int iter = 0; iter < kSortedLists.size(); iter++ ) {

		// While the current list is not empty
		while (!kSortedLists[iter].IsEmpty() ){

			// Push onto the Max Heap
			theHeap.push( kSortedLists[iter].front() );

			// Remove the element from the front
			kSortedLists[iter].pop_front();
		}
	}

	// Create the final Doubly Linked List
	DLList< int > result;

	// While the heap is not empty
	while ( !theHeap.empty() ){

		// Push the top element onto the front
		result.push_front( theHeap.top() );

		// Pop the element off the Heap
		theHeap.pop();

	}

	return result;
}

int main(){
	
	/* Create a Dynamic Array of Doubly Linked Lists of ints */
	DynArr< DLList< int > > kSortedLists;	
	
	/* Seed the random number generator */
	srand( (unsigned int)time(0) );
	
	/* Create a number of lists between 1 and 20 */
	long unsigned int numLists = (rand() % MAXLISTS);
	
	/* For the number of lists, create a Doubly Linked List and push back */
	for ( long unsigned int iter = 0; iter < numLists; iter++ ){
	 
	
		/* Create a temporary List */
		DLList< int > tempList;
		
		/* Put the temporary List into the kSortedLists */
		kSortedLists.push_back( tempList );

	}
	
	/* Get a random number of values between 0 and 40 */
	long unsigned int numValues = rand() % MAXVALS;
	
	/* Do not push if the number of lists is 0 */
	if (numLists != 0){
		
		for (long unsigned int iter = 0; iter < numValues; iter++){
		
			/* Get a random list */
			long unsigned int currList = rand() % numLists;
			
			/* Get a random integer */
			int value = (int)(rand() % 100);
			
			/* Put the random integer into the randomly selected list */
			kSortedLists[ currList ].SortInsert( value );
		}
	}
			
	
	/* Print the generated lists to the user */
	COUT << "There are " << kSortedLists.size() << " lists to sort ";
	COUT << " and there are " << numValues << " in those lists:" << ENDL;
	for( long unsigned int iter = 0; iter < kSortedLists.size(); iter++ ){
		
		COUT << "List " << iter + 1 << ": " << kSortedLists[iter] << ENDL;
		
	}
	
	/* Sort the k lists */
	DLList<int> result = SortKLists( kSortedLists);
	
	COUT << ENDL << "Final Sorted List: " << result << ENDL;
	
}
