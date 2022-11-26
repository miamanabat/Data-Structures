#include "../inc/Printer.h"
  
// Default constructor
Printer::Printer() : pages(0), job(""){}

// Overloaded Constructor
Printer::Printer(const unsigned int& pages_in, const STRING& job_in) 
    : pages( pages_in ),
    job( job_in ) {}

// Operator >= with opposite rule
bool Printer::operator>=( const Printer& rhs ) const {
    return pages < rhs.pages;

}

// Operator > with opposite rule
bool Printer::operator>( const Printer& rhs ) const {
    return pages <= rhs.pages;

}

// Operator <= with opposite rule
bool Printer::operator<=( const Printer& rhs ) const {
    return pages > rhs.pages;

}

// Operator < with opposite rule
bool Printer::operator<( const Printer& rhs ) const {
    return pages >= rhs.pages;

}

// Operator == with opposite rule
bool Printer::operator==( const Printer& rhs ) const {
    return pages == rhs.pages;

}

// Operator != with opposite rule
bool Printer::operator!=( const Printer& rhs ) const {
    return pages != rhs.pages;

}

// Friend Operator
std::ostream& operator<<( std::ostream& out, const Printer& printer ){

    out << "Pages = " << printer.pages << ", Job = " << printer.job;
    return out;

}
