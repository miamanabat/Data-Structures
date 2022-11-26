/*
  File: JKFF.h
  Author: Mia Manabat
  Email: mmanabat@nd.edu
*/

#ifndef JKFF_H
#define JKFF_H

class JKFF {
  private:
      bool Q;
      bool Qbar;

  public:
      JKFF();

      void updateVals(bool CLK, bool J_in, bool K_in);

      bool getQ() const;

      bool getQbar() const;
};

#endif
