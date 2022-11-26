/* Name: Mia Manabat
 * Email: mmanabat@nd.edu
 * File: decode.cpp
 */
#include "../inc/decode.h"


int decode( STRING the_str) {

    // keeping track of total, previous two totals
    int total = 1;
    int count_0 = 1;
    int count_1 = 1;

    for (unsigned int i = 0; i < the_str.size() - 1; i++){
                
        // first and second digit in the string
        int first_digit = the_str.at(i);
        int second_digit = the_str.at(i + 1);

        // check for a pair of special nums (1-(0-9) or 2-(0-5))
        if (first_digit == '1' || (first_digit == '2' && second_digit <= '5' && second_digit >= '0')){

            // adding count_0 to the total (total before the special pair) to account for new combinations
            total += count_0;

        }
        else{

            // updating the total to the previous count since other nums don't add to total
            total = count_1;
        }

        // updating the total counts (2 previous totals)
        count_0 = count_1;
        count_1 = total;

    }
   
    return total;   
 }
