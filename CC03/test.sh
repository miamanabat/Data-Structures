#!/bin/sh
# Grading script developed by Matthew Morrison
# Spring 2021 - Data Structures - Coding Challenge 3 - Grading Script

# Variables for the script
SCRIPT_OUT="grade.out"
REDIRECT="redirect.out"

# Point Breakdown Variables
STUDENT_GRADE=0
TOTAL=400
VALGRIND_MSG="ERROR SUMMARY: 0 errors"
VALGRIND_PTS=10
CLEAN=10
INIT=10
DECODE=10
DECODE_1=10
DECODE_2=15
DECODE_3=15
DECODE_4=15
DECODE_5=15
DECODE_6=15
DECODE_7=15
DECODE_8=15
DECODE_9=20
DECODE_10=20
MAX_PROD=10
MAX_PROD_1=15
MAX_PROD_2=15
MAX_PROD_3=15
MAX_PROD_4=20
MAX_PROD_5=20
MAX_PROD_6=20
MAX_PROD_7=20
MAX_PROD_8=20
MAX_PROD_9=20
MAX_PROD_10=20


# Delete the script.out so student can test multiple times
# and we can still use >> to append while running a test
if test -f $SCRIPT_OUT; then
    rm $SCRIPT_OUT
fi

# Write initial messages to the output file
INTRO_MESSAGE="Grading script for Coding Challenge 3"
NAME_MESSAGE="Type in the student's name:"
ID_MESSAGE="Type in the student's Notre Dame netID name:"

echo "-----------------------------" >> $SCRIPT_OUT
echo $INTRO_MESSAGE >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Get the student's name and ND netID
echo $NAME_MESSAGE
read STUDENT_NAME
echo $ID_MESSAGE
read STUDENT_ID

# Print the name and ID to the script.out
echo "Student's Name: $STUDENT_NAME" >> $SCRIPT_OUT
echo "Student's ID  : $STUDENT_ID" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT 
echo "If the outputs appear to match, but the test failed, please check for whitespace in your output."  >> $SCRIPT_OUT
echo "By making these cosmetic changes to your output, you can save the TAs hours of grading time."  >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT 
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# Test the make initialize command 
#######################
INIT_REDIRECT="initialize.out"

echo "Testing make initialize" >> $SCRIPT_OUT
MAKE_INIT_EXPECTED_FIRST="rm -rf obj exe"
MAKE_INIT_EXPECTED_SECOND="mkdir obj exe"
MAKE_INIT_RESULT=$(make initialize > $INIT_REDIRECT 2>&1)

MAKE_INIT_PRINT=$(cat $INIT_REDIRECT)

# Send results to the script
echo "Expected make initialize output: " >> $SCRIPT_OUT 
echo $MAKE_INIT_EXPECTED_FIRST >> $SCRIPT_OUT 
echo $MAKE_INIT_EXPECTED_SECOND >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "Actual make initialize output  : " >> $SCRIPT_OUT
echo $MAKE_INIT_PRINT >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Add points to overall score or mark as 0 if not for make initialize

if grep -q "$MAKE_INIT_EXPECTED_FIRST" $INIT_REDIRECT && grep -q "$MAKE_INIT_EXPECTED_SECOND" $INIT_REDIRECT

then 
	echo "make initialize test passed" >> $SCRIPT_OUT
	echo "$INIT / $INIT" >> $SCRIPT_OUT
	((STUDENT_GRADE += $INIT))
	
else
	echo "make initialize test failed" >> $SCRIPT_OUT
	echo "0 / $INIT" >> $SCRIPT_OUT
	
fi

rm $INIT_REDIRECT


#######################
# Test the make clean command 
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

# Test re-direct file
CLEAN_REDIRECT="clean.out"

echo "Testing make clean" >> $SCRIPT_OUT
MAKE_CLEAN_EXPECTED="rm -rf obj/* exe/*"
MAKE_CLEAN_RESULT=$(make clean > $CLEAN_REDIRECT 2>&1)

# Get the results into a variable 
MAKE_CLEAN_PRINT=$(cat $CLEAN_REDIRECT)

# Send results to the script
echo "Expected 'make clean' output: $MAKE_CLEAN_EXPECTED" >> $SCRIPT_OUT
echo "Actual 'make clean' output  : $MAKE_CLEAN_PRINT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


# Add points to overall score or mark as 0 if not
if grep -q "$MAKE_TEST_EXPECTED" $CLEAN_REDIRECT

then 
	echo "make clean test passed" >> $SCRIPT_OUT
	echo "$CLEAN / $CLEAN" >> $SCRIPT_OUT
	((STUDENT_GRADE += $CLEAN))
	
else
	echo "make clean test failed" >> $SCRIPT_OUT
	echo "0 / 10" >> $SCRIPT_OUT
	
fi

# Delete the make clean redirect 
rm $CLEAN_REDIRECT


#######################
# Test the make decode_sol command 
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing make decode_sol" >> $SCRIPT_OUT

# make decode comparison variables
MAKE_DECODE="make decode_sol"
MAKE_DECODE_EXPECTED_FIRST="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -c src/decode_sol.cpp -o obj/decode_sol.o"
MAKE_DECODE_EXPECTED_SECOND="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -c src/decode.cpp -o obj/decode.o"
MAKE_DECODE_EXPECTED_THIRD="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -o exe/decode_sol obj/decode_sol.o obj/decode.o"
MAKE_DECODE_RESULT=$( $MAKE_DECODE )

# Delete redirect and send make result to redirect 

echo $MAKE_DECODE_RESULT >> $REDIRECT

# Send results to the script
echo "Expected $MAKE_DECODE output: " >> $SCRIPT_OUT
echo $MAKE_DECODE_EXPECTED_FIRST >> $SCRIPT_OUT
echo $MAKE_DECODE_EXPECTED_SECOND >> $SCRIPT_OUT
echo $MAKE_DECODE_EXPECTED_THIRD >> $SCRIPT_OUT
echo "Actual $MAKE_DECODE output  : " >> $SCRIPT_OUT
echo $MAKE_DECODE_RESULT >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Add points to overall score or mark as 0 if not for make lucky

if grep -q "$MAKE_DECODE_EXPECTED_FIRST" $REDIRECT && grep -q "$MAKE_DECODE_EXPECTED_SECOND" $REDIRECT && grep -q "$MAKE_DECODE_EXPECTED_THIRD" $REDIRECT

then 
	echo "$MAKE_DECODE test passed" >> $SCRIPT_OUT
	echo "$DECODE / $DECODE" >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE))
	
else
	echo "$MAKE_DECODE test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE" >> $SCRIPT_OUT
	
fi

############################################################
# Running ./lucky tests
############################################################

# lucky tests 
DECODE_1_TEST="./exe/decode_sol"
DECODE_1_EXPECTED="Incorrect number of inputs"

DECODE_2_TEST="./exe/decode_sol 00000"
DECODE_2_EXPECTED="1"

DECODE_3_TEST="./exe/decode_sol 0123"
DECODE_3_EXPECTED="3"

DECODE_4_TEST="./exe/decode_sol 0126"
DECODE_4_EXPECTED="2"

DECODE_5_TEST="./exe/decode_sol 0125"
DECODE_5_EXPECTED="3"

DECODE_6_TEST="./exe/decode_sol 25"
DECODE_6_EXPECTED="2"

DECODE_7_TEST="./exe/decode_sol 26"
DECODE_7_EXPECTED="1"

DECODE_8_TEST="./exe/decode_sol 0121342"
DECODE_8_EXPECTED="5"

DECODE_9_TEST="./exe/decode_sol 01213425"
DECODE_9_EXPECTED="10"

DECODE_10_TEST="./exe/decode_sol 01213426"
DECODE_10_EXPECTED="5"

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing decode_sol program" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# DECODE_1 Test
#######################

# Need to re-compile on first test since $( $MAKE_DECODE ) automatically deletes executable
$MAKE_DECODE > $REDIRECT
DECODE_1_RESULT=$( $DECODE_1_TEST )

echo "Expected '$DECODE_1_TEST' output: $DECODE_1_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$DECODE_1_TEST' output: $DECODE_1_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$DECODE_1_EXPECTED" = "$DECODE_1_RESULT" ]; 

then 
	echo "$DECODE_1_TEST test passed" >> $SCRIPT_OUT
	echo "$DECODE_1 / $DECODE_1" >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE_1))
	
else
	echo "DECODE_1_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE_1" >> $SCRIPT_OUT
	
fi

#######################
# DECODE_2 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

DECODE_2_RESULT=$( $DECODE_2_TEST )

echo "Expected '$DECODE_2_TEST' output: $DECODE_2_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$DECODE_2_TEST' output: $DECODE_2_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$DECODE_2_EXPECTED" = "$DECODE_2_RESULT" ]; 

then 
	echo "$DECODE_2_TEST test passed" >> $SCRIPT_OUT
	echo "$DECODE_2 / $DECODE_2" >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE_2))
	
else
	echo "DECODE_2_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE_2" >> $SCRIPT_OUT
	
fi


#######################
# DECODE_3 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

DECODE_3_RESULT=$( $DECODE_3_TEST )

echo "Expected '$DECODE_3_TEST' output: $DECODE_3_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$DECODE_3_TEST' output: $DECODE_3_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$DECODE_3_EXPECTED" = "$DECODE_3_RESULT" ]; 

then 
	echo "$DECODE_3_TEST test passed" >> $SCRIPT_OUT
	echo "$DECODE_3 / $DECODE_3" >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE_3))
	
else
	echo "DECODE_3_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE_3" >> $SCRIPT_OUT
	
fi


#######################
# DECODE_4 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

DECODE_4_RESULT=$( $DECODE_4_TEST )

echo "Expected '$DECODE_4_TEST' output: $DECODE_4_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$DECODE_4_TEST' output: $DECODE_4_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$DECODE_4_EXPECTED" = "$DECODE_4_RESULT" ]; 

then 
	echo "$DECODE_4_TEST test passed" >> $SCRIPT_OUT
	echo "$DECODE_4 / $DECODE_4" >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE_4))
	
else
	echo "DECODE_4_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE_4" >> $SCRIPT_OUT
	
fi


#######################
# DECODE_5 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

DECODE_5_RESULT=$( $DECODE_5_TEST )

echo "Expected '$DECODE_5_TEST' output: $DECODE_5_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$DECODE_5_TEST' output: $DECODE_5_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$DECODE_5_EXPECTED" = "$DECODE_5_RESULT" ]; 

then 
	echo "$DECODE_5_TEST test passed" >> $SCRIPT_OUT
	echo "$DECODE_5 / $DECODE_5" >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE_5))
	
else
	echo "DECODE_5_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE_5" >> $SCRIPT_OUT
	
fi


#######################
# DECODE_6 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

DECODE_6_RESULT=$( $DECODE_6_TEST )

echo "Expected '$DECODE_6_TEST' output: $DECODE_6_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$DECODE_6_TEST' output: $DECODE_6_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$DECODE_6_EXPECTED" = "$DECODE_6_RESULT" ]; 

then 
	echo "$DECODE_6_TEST test passed" >> $SCRIPT_OUT
	echo "$DECODE_6  / $DECODE_6 " >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE_6 ))
	
else
	echo "DECODE_6_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE_6 " >> $SCRIPT_OUT
	
fi


#######################
# DECODE_7 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

DECODE_7_RESULT=$( $DECODE_7_TEST )

echo "Expected '$DECODE_7_TEST' output: $DECODE_7_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$DECODE_7_TEST' output: $DECODE_7_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$DECODE_7_EXPECTED" = "$DECODE_7_RESULT" ]; 

then 
	echo "$DECODE_7_TEST test passed" >> $SCRIPT_OUT
	echo "$DECODE_7 / $DECODE_7" >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE_7))
	
else
	echo "DECODE_7_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE_7" >> $SCRIPT_OUT
	
fi


#######################
# DECODE_8 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

DECODE_8_RESULT=$( $DECODE_8_TEST )

echo "Expected '$DECODE_8_TEST' output: $DECODE_8_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$DECODE_8_TEST' output: $DECODE_8_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$DECODE_8_EXPECTED" = "$DECODE_8_RESULT" ]; 

then 
	echo "$DECODE_8_TEST test passed" >> $SCRIPT_OUT
	echo "$DECODE_8 / $DECODE_8" >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE_8))
	
else
	echo "DECODE_8_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE_8" >> $SCRIPT_OUT
	
fi


#######################
# DECODE_9 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

DECODE_9_RESULT=$( $DECODE_9_TEST )

echo "Expected '$DECODE_9_TEST' output: $DECODE_9_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$DECODE_9_TEST' output: $DECODE_9_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$DECODE_9_EXPECTED" = "$DECODE_9_RESULT" ]; 

then 
	echo "$DECODE_9_TEST test passed" >> $SCRIPT_OUT
	echo "$DECODE_9 / $DECODE_9" >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE_9))
	
else
	echo "DECODE_9_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE_9" >> $SCRIPT_OUT
	
fi


#######################
# DECODE_10 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

DECODE_10_RESULT=$( $DECODE_10_TEST )

echo "Expected '$DECODE_10_TEST' output: $DECODE_10_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$DECODE_10_TEST' output: $DECODE_10_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$DECODE_10_EXPECTED" = "$DECODE_10_RESULT" ]; 

then 
	echo "$DECODE_10_TEST test passed" >> $SCRIPT_OUT
	echo "$DECODE_10  / $DECODE_10 " >> $SCRIPT_OUT
	((STUDENT_GRADE += $DECODE_10 ))
	
else
	echo "DECODE_10_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DECODE_10 " >> $SCRIPT_OUT
	
fi

#########################
# DECODE_VALGRIND Test
#########################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

# Test re-direct file
DECODE_VALGRIND_REDIRECT="decode_sol_valgrind.out"

# valgrind command 
DECODE_VALGRIND_TEST="valgrind --tool=memcheck --leak-check=yes $DECODE_4_TEST > $DECODE_VALGRIND_REDIRECT 2>&1"

# Print tests to student 
echo "decode_sol valgrind test" >> $SCRIPT_OUT
echo $DECODE_VALGRIND_TEST >> $SCRIPT_OUT
make decode_sol > $REDIRECT

# Run the valgrind test
DECODE_VALGRIND_RESULT=$(valgrind --tool=memcheck --leak-check=yes ./exe/decode_sol $DECODE_4 > $DECODE_VALGRIND_REDIRECT 2>&1)
$DECODE_VALGRIND_RESULT

#Check to determine if the valgrind passed:
if grep -q "$VALGRIND_MSG" $DECODE_VALGRIND_REDIRECT

then
	echo "$DECODE_VALGRIND_TEST passed" >> $SCRIPT_OUT
	echo "$VALGRIND_PTS / $VALGRIND_PTS" >> $SCRIPT_OUT
	((STUDENT_GRADE += $VALGRIND_PTS))
	
else
	echo "$DECODE_VALGRIND_TEST failed" >> $SCRIPT_OUT
	echo "0 / $VALGRIND_PTS" >> $SCRIPT_OUT
	echo "" >> $SCRIPT_OUT
	echo "Contents of the valgrind test:" >> $SCRIPT_OUT
	cat $DECODE_VALGRIND_REDIRECT >> $SCRIPT_OUT
	
fi

# Remove the valgrind re-direct file 
rm $DECODE_VALGRIND_REDIRECT

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


############################################################
# Running ./streams tests
############################################################

# streams tests 
MAX_PROD_TEST_1_TEST="./exe/max_prod_test"
MAX_PROD_TEST_1_EXPECTED="Incorrect number of inputs"

MAX_PROD_TEST_2_TEST="./exe/max_prod_test 0"
MAX_PROD_TEST_2_EXPECTED="0"

MAX_PROD_TEST_3_TEST="./exe/max_prod_test 10"
MAX_PROD_TEST_3_EXPECTED="10"

MAX_PROD_TEST_4_TEST="./exe/max_prod_test -2 0 -1"
MAX_PROD_TEST_4_EXPECTED="0"


MAX_PROD_TEST_5_TEST="./exe/max_prod_test -2 0 -1 -4"
MAX_PROD_TEST_5_EXPECTED="4"

MAX_PROD_TEST_6_TEST="./exe/max_prod_test 10 32 -2 0 -10 -5 100"
MAX_PROD_TEST_6_EXPECTED="5000"

MAX_PROD_TEST_7_TEST="./exe/max_prod_test 10 32 -2 0 -10 5 100"
MAX_PROD_TEST_7_EXPECTED="500"

MAX_PROD_TEST_8_TEST="./exe/max_prod_test 10 32 -2 0 10 -5 100"
MAX_PROD_TEST_8_EXPECTED="320"

MAX_PROD_TEST_9_TEST="./exe/max_prod_test 10 32 -2 18 -10 -5 100"
MAX_PROD_TEST_9_EXPECTED="115200"

MAX_PROD_TEST_10_TEST="./exe/max_prod_test 10 32 -2 18 -10 5 100"
MAX_PROD_TEST_10_EXPECTED="57600000"

#######################
# Test the make max_prod_test command 
#######################

MAX_PROD_TEST="make max_prod_test"

MAX_PROD_TEST_EXPECTED_FIRST="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -c src/max_prod_test.cpp -o obj/max_prod_test.o"
MAX_PROD_TEST_EXPECTED_SECOND="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -c src/max_prod.cpp -o obj/max_prod.o"
MAX_PROD_TEST_EXPECTED_THIRD="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -o exe/max_prod_test obj/max_prod_test.o obj/max_prod.o"

# Clean the object files and then run the test 
make clean >> $REDIRECT

# Run the make command and get the result 
MAX_PROD_TEST_RESULT=$( $MAX_PROD_TEST )

# Send results to the script
echo "Expected $MAX_PROD_TEST output: " >> $SCRIPT_OUT 
echo $MAX_PROD_TEST_EXPECTED_FIRST >> $SCRIPT_OUT 
echo $MAX_PROD_TEST_EXPECTED_SECOND >> $SCRIPT_OUT 
echo $MAX_PROD_TEST_EXPECTED_THIRD >> $SCRIPT_OUT 
echo "Actual $MAX_PROD_TEST output  : " >> $SCRIPT_OUT 
echo $MAX_PROD_TEST_RESULT >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

echo $MAX_PROD_TEST_RESULT >> $REDIRECT

# Add points to overall score or mark as 0 if not for make lucky
if grep -q "$MAX_PROD_TEST_EXPECTED_FIRST" $REDIRECT && grep -q "$MAX_PROD_TEST_EXPECTED_SECOND" $REDIRECT && grep -q "$MAX_PROD_TEST_EXPECTED_THIRD" $REDIRECT

then 
	echo "$MAX_PROD_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD / $MAX_PROD" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD))
	
else
	echo "$MAX_PROD_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# MAX_PROD_TEST_1 Test
#######################

# Need to re-compile on first test since $( $MAX_PROD_TEST ) automatically deletes executable
$MAX_PROD_TEST > $REDIRECT

# Run the test and save the output 
MAX_PROD_TEST_1_RESULT=$( $MAX_PROD_TEST_1_TEST )

echo "Expected '$MAX_PROD_TEST_1_TEST' output: $MAX_PROD_TEST_1_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$MAX_PROD_TEST_1_TEST' output: $MAX_PROD_TEST_1_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$MAX_PROD_TEST_1_EXPECTED" = "$MAX_PROD_TEST_1_RESULT" ]; 

then 
	echo "$MAX_PROD_TEST_1_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD_1 / $MAX_PROD_1" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD_1))
	
else
	echo "MAX_PROD_TEST_1_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD_1" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

#######################
# MAX_PROD_TEST_2 Test
#######################


MAX_PROD_TEST_2_RESULT=$( $MAX_PROD_TEST_2_TEST )

echo "Expected '$MAX_PROD_TEST_2_TEST' output: $MAX_PROD_TEST_2_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$MAX_PROD_TEST_2_TEST' output: $MAX_PROD_TEST_2_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$MAX_PROD_TEST_2_EXPECTED" = "$MAX_PROD_TEST_2_RESULT" ]; 

then 
	echo "$MAX_PROD_TEST_2_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD_2 / $MAX_PROD_2" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD_2))
	
else
	echo "MAX_PROD_TEST_2_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD_2" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# MAX_PROD_TEST_3 Test
#######################

MAX_PROD_TEST_3_RESULT=$( $MAX_PROD_TEST_3_TEST )

echo "Expected '$MAX_PROD_TEST_3_TEST' output: $MAX_PROD_TEST_3_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$MAX_PROD_TEST_3_TEST' output: $MAX_PROD_TEST_3_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$MAX_PROD_TEST_3_EXPECTED" = "$MAX_PROD_TEST_3_RESULT" ]; 

then 
	echo "$MAX_PROD_TEST_3_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD_3 / $MAX_PROD_3" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD_3))
	
else
	echo "MAX_PROD_TEST_3_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD_3" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# MAX_PROD_TEST_4 Test
#######################

MAX_PROD_TEST_4_RESULT=$( $MAX_PROD_TEST_4_TEST )

echo "Expected '$MAX_PROD_TEST_4_TEST' output: $MAX_PROD_TEST_4_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$MAX_PROD_TEST_4_TEST' output: $MAX_PROD_TEST_4_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$MAX_PROD_TEST_4_EXPECTED" = "$MAX_PROD_TEST_4_RESULT" ]; 

then 
	echo "$MAX_PROD_TEST_4_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD_4 / $MAX_PROD_4" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD_4))
	
else
	echo "MAX_PROD_TEST_4_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD_4" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# MAX_PROD_TEST_5 Test
#######################

MAX_PROD_TEST_5_RESULT=$( $MAX_PROD_TEST_5_TEST )

echo "Expected '$MAX_PROD_TEST_5_TEST' output: $MAX_PROD_TEST_5_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$MAX_PROD_TEST_5_TEST' output: $MAX_PROD_TEST_5_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$MAX_PROD_TEST_5_EXPECTED" = "$MAX_PROD_TEST_5_RESULT" ]; 

then 
	echo "$MAX_PROD_TEST_5_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD_5 / $MAX_PROD_5" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD_5))
	
else
	echo "MAX_PROD_TEST_5_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD_5" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# MAX_PROD_TEST_6 Test
#######################

MAX_PROD_TEST_6_RESULT=$( $MAX_PROD_TEST_6_TEST )

echo "Expected '$MAX_PROD_TEST_6_TEST' output: $MAX_PROD_TEST_6_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$MAX_PROD_TEST_6_TEST' output: $MAX_PROD_TEST_6_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$MAX_PROD_TEST_6_EXPECTED" = "$MAX_PROD_TEST_6_RESULT" ]; 

then 
	echo "$MAX_PROD_TEST_6_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD_6 / $MAX_PROD_6" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD_6))
	
else
	echo "MAX_PROD_TEST_6_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD_6" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# MAX_PROD_TEST_7 Test
#######################

MAX_PROD_TEST_7_RESULT=$( $MAX_PROD_TEST_7_TEST )

echo "Expected '$MAX_PROD_TEST_7_TEST' output: $MAX_PROD_TEST_7_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$MAX_PROD_TEST_7_TEST' output: $MAX_PROD_TEST_7_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$MAX_PROD_TEST_7_EXPECTED" = "$MAX_PROD_TEST_7_RESULT" ]; 

then 
	echo "$MAX_PROD_TEST_7_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD_7 / $MAX_PROD_7" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD_7))
	
else
	echo "MAX_PROD_TEST_7_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD_7" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# MAX_PROD_TEST_8 Test
#######################

MAX_PROD_TEST_8_RESULT=$( $MAX_PROD_TEST_8_TEST )

echo "Expected '$MAX_PROD_TEST_8_TEST' output: $MAX_PROD_TEST_8_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$MAX_PROD_TEST_8_TEST' output: $MAX_PROD_TEST_8_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$MAX_PROD_TEST_8_EXPECTED" = "$MAX_PROD_TEST_8_RESULT" ]; 

then 
	echo "$MAX_PROD_TEST_8_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD_8 / $MAX_PROD_8" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD_8))
	
else
	echo "MAX_PROD_TEST_8_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD_8" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# MAX_PROD_TEST_9 Test
#######################

MAX_PROD_TEST_9_RESULT=$( $MAX_PROD_TEST_9_TEST )

echo "Expected '$MAX_PROD_TEST_9_TEST' output: $MAX_PROD_TEST_9_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$MAX_PROD_TEST_9_TEST' output: $MAX_PROD_TEST_9_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$MAX_PROD_TEST_9_EXPECTED" = "$MAX_PROD_TEST_9_RESULT" ]; 

then 
	echo "$MAX_PROD_TEST_9_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD_9 / $MAX_PROD_9" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD_9))
	
else
	echo "MAX_PROD_TEST_9_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD_9" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# MAX_PROD_TEST_10 Test
#######################

MAX_PROD_TEST_10_RESULT=$( $MAX_PROD_TEST_10_TEST )

echo "Expected '$MAX_PROD_TEST_10_TEST' output: $MAX_PROD_TEST_10_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$MAX_PROD_TEST_10_TEST' output: $MAX_PROD_TEST_10_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$MAX_PROD_TEST_10_EXPECTED" = "$MAX_PROD_TEST_10_RESULT" ]; 

then 
	echo "$MAX_PROD_TEST_10_TEST test passed" >> $SCRIPT_OUT
	echo "$MAX_PROD_10 / $MAX_PROD_10" >> $SCRIPT_OUT
	((STUDENT_GRADE += $MAX_PROD_10))
	
else
	echo "MAX_PROD_TEST_10_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $MAX_PROD_10" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#########################
# MAX_PROD_TEST_VALGRIND Test
#########################

# Test re-direct file
MAX_PROD_TEST_VALGRIND_REDIRECT="max_prod_valgrind.out"

# valgrind command 
MAX_PROD_TEST_VALGRIND_TEST="valgrind --tool=memcheck --leak-check=yes $MAX_PROD_TEST_6_TEST > $MAX_PROD_TEST_VALGRIND_REDIRECT 2>&1"

# Print tests to student 
echo "max_prod_test valgrind test" >> $SCRIPT_OUT
echo $MAX_PROD_TEST_VALGRIND_TEST >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Run the valgrind test
MAX_PROD_TEST_VALGRIND_RESULT=$( valgrind --tool=memcheck --leak-check=yes $MAX_PROD_TEST_6_TEST > $MAX_PROD_TEST_VALGRIND_REDIRECT 2>&1 )
$MAX_PROD_TEST_VALGRIND_RESULT


#Check to determine if the valgrind passed:
if grep -q "$VALGRIND_MSG" $MAX_PROD_TEST_VALGRIND_REDIRECT

then
	echo "$MAX_PROD_TEST_VALGRIND_TEST passed" >> $SCRIPT_OUT
	echo "$VALGRIND_PTS / $VALGRIND_PTS" >> $SCRIPT_OUT
	((STUDENT_GRADE += $VALGRIND_PTS))
	
else
	echo "$MAX_PROD_TEST_VALGRIND_TEST failed" >> $SCRIPT_OUT
	echo "0 / $VALGRIND_PTS" >> $SCRIPT_OUT
	echo "" >> $SCRIPT_OUT
	echo "Contents of the valgrind test:" >> $SCRIPT_OUT
	cat $MAX_PROD_TEST_VALGRIND_REDIRECT >> $SCRIPT_OUT
fi


# Remove the valgrind re-direct file 
rm $MAX_PROD_TEST_VALGRIND_REDIRECT

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT



# Final Grade to both the screen and the script file.
echo "-----------------------------" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "CC03 Coding Portion Grade for $STUDENT_NAME ($STUDENT_ID): $STUDENT_GRADE / $TOTAL " >> $SCRIPT_OUT
echo "CC03 Coding Portion Grade for $STUDENT_NAME ($STUDENT_ID): $STUDENT_GRADE / $TOTAL "
echo "Run 'vim $SCRIPT_OUT' to see the result of the test script"


# Clean and delete re-directions
make clean > $REDIRECT

rm $REDIRECT