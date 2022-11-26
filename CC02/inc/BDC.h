/*
  File: BDC.h
  Author: Mia Manabat
  Email: mmanabat@nd.edu
*/

#ifndef BDC_H
#define BDC_H

#include "JKFF.h"
#include <iostream>
#include <fstream>


// Structs: AND, OR, NOT
struct AND {
    private:
        bool A;
        bool B;

    public:
        AND();
        bool calc_and(bool A_in, bool B_in);
        bool get_and() const;
};

struct OR {
    private:
        bool A;
        bool B;

    public:
        OR();
        bool calc_or(bool A_in, bool B_in);
        bool get_or() const;
};

struct NOT {
    private:
        bool In;
    public:
        NOT();
        bool calc_not(bool In_in);
        bool get_not() const;

};

// BDC class, contains 4 JKFFs
class BDC {
    private:
        JKFF ff1;
        JKFF ff2;
        JKFF ff3;
        JKFF ff4;

        unsigned int get_value() const;

    public:
        BDC();
        void count(bool clk, bool up_down);
        friend std::ostream& operator<<(std::ostream& output, const BDC& bdc);

};

#endif
