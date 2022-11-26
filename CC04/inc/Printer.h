#ifndef PRINTER_H
#define PRINTER_H

#include <string>
#include <iostream>
#include <fstream>

#define STRING std::string

class Printer{
	
	private:

      unsigned int pages;
      STRING job;

	public:

      //Default constructor
      Printer();

      // Overloaded constructor
      Printer( const unsigned int& pages_in, const STRING& job_in );   

      // Operator >= with opposite rule
      bool operator>=( const Printer& rhs ) const;

      // Operator > with opposite rule
      bool operator>( const Printer& rhs ) const;

      // Operator <= with opposite rule
      bool operator<=( const Printer& rhs ) const;

      // Operator < with opposite rule
      bool operator<( const Printer& rhs ) const;

      // Operator == with opposite rule
      bool operator==( const Printer& rhs ) const;

      // Operator != with opposite rule
      bool operator!=( const Printer& rhs ) const;

      // Friend operator
      friend std::ostream& operator<<( std::ostream& out, const Printer& printer );
	
};

#endif
