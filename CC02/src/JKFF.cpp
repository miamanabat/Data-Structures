/*
  File: JKFF.cpp
  Author: Mia Manabat
  Email: mmanabat@nd.edu
*/

#include "../inc/JKFF.h"

// Constructor
JKFF::JKFF(): Q(0), Qbar(1){}

// method to update the values of the flip flop based on clock, j, and k input
void JKFF::updateVals(bool CLK, bool J_in, bool K_in){
    // values will only change when clock is high
    if (CLK){
        // if both j and k are high, the values are switched
        if (J_in && K_in){
            Q = !Q;
            Qbar = !Qbar;
        }
        // if only one is high, Q will be assigned j, and Qbar will be assigned k
        else if (J_in || K_in){
            Q = J_in;
            Qbar = K_in;
        }
    }
}

// Access value of Q
bool JKFF::getQ() const{
    return Q;
}

// Access value of Qbar
bool JKFF::getQbar() const{
    return Qbar;
}
