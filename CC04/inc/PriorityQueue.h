#ifndef PRIORITYQUEUE_H
#define PRIORITYQUEUE_H

#include "DLList.h"

template<class T>
class PriorityQueue {

	private:

      DLList<T> dll;		

	public:

      // Default Constructor
      PriorityQueue() : dll() {}

      // Push: calls SortInsert
      void push( const T& value ){

          dll.SortInsert( value );
      
      }

      // Pop: calls pop_front
      void pop(){

          if ( !dll.IsEmpty() ){

              dll.pop_front();

          }
      }

      // Top: calls front and returns data
      T top() const {

          return dll.front();

      }
      
      // Empty: calls isempty and returns the bool
      bool empty() const {
  
          return dll.IsEmpty();

      }



};

#endif
