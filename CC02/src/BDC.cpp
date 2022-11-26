#include "../inc/BDC.h"
#include "../inc/JKFF.h"
#include <iostream>
#include <fstream>


// Struct AND
AND::AND(): A(false), B(false){}

// update member values, output the value of A AND B
bool AND::calc_and(bool A_in, bool B_in){
    A = A_in;
    B = B_in;
    return A && B;
}

// To access the value of A && B
bool AND::get_and() const{
    return A && B;
}


// Struct OR
OR::OR(): A(false), B(false){}

//  update member values, output the value of A OR B
bool OR::calc_or(bool A_in, bool B_in){
    A = A_in;
    B = B_in;
    return A || B;
}

// to access the value of A || B
bool OR::get_or() const{
    return A || B;
}


// Struct Not
NOT::NOT(): In(false){}

// update member value, output the value stored in In member
bool NOT::calc_not(bool In_in){
    In = !In_in;
    return In;
}

// to access the value of In
bool NOT::get_not() const{
    return In;
}


// Class constructor with four JKFF instantiations as private members
BDC::BDC(): ff1(JKFF()), ff2(JKFF()), ff3(JKFF()), ff4(JKFF()){}

// to access the value outputted by the BDC in decimal
unsigned int BDC::get_value() const {
    return ff4.getQ()*8 + ff3.getQ() * 4 + ff2.getQ() * 2 + ff1.getQ() * 1;
}

// assembling the BDC with ANDs, ORs, a NOT, and the JKFFs
void BDC::count(bool clk, bool up_down) {

    // First ff should have true for J, K, clk on clk
    ff1.updateVals(clk, 1, 1);

    // Create a NOT that inverts the up_down
    NOT not_0;
    not_0.calc_not(up_down);

    // Create the first AND with inputs from the NOT and the ~Q from the first JKFF
    AND and_0;
    and_0.calc_and(not_0.get_not(), ff1.getQbar());

    // Create the second AND with inputs from the up/down bool and the Q from the first ff
    AND and_1;
    and_1.calc_and(up_down, ff1.getQ());

    // Create the first OR with inputs from the first two AND gates
    OR or_0;
    or_0.calc_or(and_0.get_and(), and_1.get_and());

    //Second JK flip flop should have the output from the first OR gate for both J and K, clk on clk
    ff2.updateVals(clk, or_0.get_or(), or_0.get_or());

    // Create the third AND with inputs from first AND and ~Q from 2nd ff
    AND and_2;
    and_2.calc_and(and_0.get_and(), ff2.getQbar());

    // Create the fourth AND with inputs from the second AND and Q from 2nd ff
    AND and_3;
    and_3.calc_and(and_1.get_and(), ff2.getQ());

    // Create the second OR with inputs from third and fourth AND gates
    OR or_1;
    or_1.calc_or(and_2.get_and(), and_3.get_and());

    // The third JK ff should have the output from the second OR gate for both J, K, clk on clk
    ff3.updateVals(clk, or_1.get_or(), or_1.get_or());

    // Create the fifth AND with inputs from third AND and ~Q from third ff
    AND and_4;
    and_4.calc_and(and_2.get_and(), ff3.getQbar());

    // Create the sixth AND with inputs from fourth AND and Q from third ff
    AND and_5;
    and_5.calc_and(and_3.get_and(), ff3.getQ());

    // Create the third OR with the inputs from the fifth and sixth AND gates
    OR or_2;
    or_2.calc_or(and_4.get_and(), and_5.get_and());

    // The third JK ff should have output from the third OR gate on both j, k, clk on clk
    ff4.updateVals(clk, or_2.get_or(), or_2.get_or());
}

// overloaded friend operator for outputting all the Q values
std::ostream& operator<<(std::ostream& output, const BDC& bdc) {
    output << bdc.ff4.getQ() << " " << bdc.ff3.getQ() << " " << bdc.ff2.getQ() << " " << bdc.ff1.getQ() << " " << bdc.get_value();
    return output;
}
