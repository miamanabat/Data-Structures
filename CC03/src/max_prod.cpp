/* Name: Mia Manabat
 * Email: mmanabat@nd.edu
 * File: max_prod.cpp
 */

#include "../inc/max_prod.h"

int max_prod( VECTOR<int>& the_vec ) {
    
    // global, local, and local negative max to keep track of while going through the vector
    int global_max = the_vec.at(0);
    int local_max = the_vec.at(0);
    int local_neg_max = the_vec.at(0);

    // loop through vector starting at second element
    for (long unsigned int iter = 1; iter < the_vec.size(); iter++ ){

        // temporary vars to test the product of
        int temp_val = local_max * the_vec.at(iter);
        int temp_val_neg = local_neg_max * the_vec.at(iter);


        // if the local negative max is 0, it is set to the current element, otherwise the local_neg_max * current element
        local_neg_max = local_neg_max == 0 ? the_vec.at(iter) : temp_val_neg;

        // the local_max is set to the greater of the current element and the product of the local_max * current element
        local_max = the_vec.at(iter) > temp_val ? the_vec.at(iter) : temp_val;

        // global_max is set to the greatest of the three max values
        global_max = local_max > global_max ? local_max : global_max;
        
        global_max = local_neg_max > global_max ? local_neg_max : global_max;
    }

    return global_max;

}
