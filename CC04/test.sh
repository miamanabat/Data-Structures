#!/bin/sh
# Grading script developed by Matthew Morrison
# Spring 2021 - Data Structures - Coding Challenge 4 - Grading Script

# Variables for the script
SCRIPT_OUT="grade.out"
REDIRECT="redirect.out"

# Point Breakdown Variables
STUDENT_GRADE=0
TOTAL=400
CLEAN=10
INIT=10
SORDLLTEST=25
SORDLLTEST_1=5
SORDLLTEST_2=15
SORDLLTEST_3=15
SORDLLTEST_4=15
SORDLLTEST_5=15
SORDLLTEST_6=15
SORDLLTEST_7=15
SORDLLTEST_8=15
SORDLLTEST_9=15
SORDLLTEST_10=15
PQ_TEST_SCORE=25
PQ_TEST_SCORE_1=5
PQ_TEST_SCORE_2=15
PQ_TEST_SCORE_3=15
PQ_TEST_SCORE_4=15
PQ_TEST_SCORE_5=15
PQ_TEST_SCORE_6=15
PQ_TEST_SCORE_7=15
PQ_TEST_SCORE_8=15
PQ_TEST_SCORE_9=15
PQ_TEST_SCORE_10=15
PRINTER_TEST_SCORE=45


# Delete the script.out so student can test multiple times
# and we can still use >> to append while running a test
if test -f $SCRIPT_OUT; then
    rm $SCRIPT_OUT
fi

# Write initial messages to the output file
INTRO_MESSAGE="Grading script for Coding Challenge 4"
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
# Test the make SorDLLTest command 
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing make SorDLLTest" >> $SCRIPT_OUT

make clean >> $SCRIPT_OUT

# make decode comparison variables
MAKE_SORDLLTEST="make SorDLLTest"
MAKE_SORDLLTEST_EXPECTED_FIRST="g++ -m64 -std=c++11 -Weffc++ -O0 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -c src/SorDLLTest.cpp -o obj/SorDLLTest.o"
MAKE_SORDLLTEST_EXPECTED_SECOND="g++ -m64 -std=c++11 -Weffc++ -O0 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -o exe/SorDLLTest obj/SorDLLTest.o"
MAKE_SORDLLTEST_RESULT=$( $MAKE_SORDLLTEST )

# Delete redirect and send make result to redirect 

echo $MAKE_SORDLLTEST_RESULT >> $REDIRECT

# Send results to the script
echo "Expected $MAKE_SORDLLTEST output: " >> $SCRIPT_OUT
echo $MAKE_SORDLLTEST_EXPECTED_FIRST >> $SCRIPT_OUT
echo $MAKE_SORDLLTEST_EXPECTED_SECOND >> $SCRIPT_OUT
echo "Actual $MAKE_SORDLLTEST output  : " >> $SCRIPT_OUT
echo $MAKE_SORDLLTEST_RESULT >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Add points to overall score or mark as 0 if not for make lucky

if grep -q "$MAKE_SORDLLTEST_EXPECTED_FIRST" $REDIRECT && grep -q "$MAKE_SORDLLTEST_EXPECTED_SECOND" $REDIRECT

then 
	echo "$MAKE_SORDLLTEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST / $SORDLLTEST" >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST))
	
else
	echo "$MAKE_SORDLLTEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST" >> $SCRIPT_OUT
	
fi

############################################################
# Running exe/./SorDLLTest tests
############################################################

# lucky tests 
SORDLLTEST_1_TEST="./exe/SorDLLTest"
SORDLLTEST_1_EXPECTED="Incorrect number of inputs"

SORDLLTEST_2_TEST="./exe/SorDLLTest 1"
SORDLLTEST_2_EXPECTED="1 
1 "

SORDLLTEST_3_TEST="./exe/SorDLLTest 1 10"
SORDLLTEST_3_EXPECTED="1 10 
10 1 "

SORDLLTEST_4_TEST="./exe/SorDLLTest 10 1"
SORDLLTEST_4_EXPECTED="10 1 
10 1 "

SORDLLTEST_5_TEST="./exe/SorDLLTest 10 1 13"
SORDLLTEST_5_EXPECTED="10 1 13 
13 10 1 "

SORDLLTEST_6_TEST="./exe/SorDLLTest 4 7 3 10 22"
SORDLLTEST_6_EXPECTED="4 7 3 10 22 
22 10 7 4 3 "

SORDLLTEST_7_TEST="./exe/SorDLLTest 1 2 3 4 5 6 7"
SORDLLTEST_7_EXPECTED="1 2 3 4 5 6 7 
7 6 5 4 3 2 1 "

SORDLLTEST_8_TEST="./exe/SorDLLTest -1 -2 -3 -4 -5 -6 -7"
SORDLLTEST_8_EXPECTED="-1 -2 -3 -4 -5 -6 -7 
-1 -2 -3 -4 -5 -6 -7 "

SORDLLTEST_9_TEST="./exe/SorDLLTest -7 -6 -5 -4 -3 -2 -1"
SORDLLTEST_9_EXPECTED="-7 -6 -5 -4 -3 -2 -1 
-1 -2 -3 -4 -5 -6 -7 "

SORDLLTEST_10_TEST="./exe/SorDLLTest 14 1 13 2 12 3 11 4 10 5 9 6 8 7"
SORDLLTEST_10_EXPECTED="14 1 13 2 12 3 11 4 10 5 9 6 8 7 
14 13 12 11 10 9 8 7 6 5 4 3 2 1 "

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing SorDLLTest program" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# SORDLLTEST_1 Test
#######################

# Need to re-compile on first test since $( $MAKE_SORDLLTEST ) automatically deletes executable
$MAKE_SORDLLTEST > $REDIRECT
SORDLLTEST_1_RESULT=$( $SORDLLTEST_1_TEST )

echo "Expected '$SORDLLTEST_1_TEST' output: $SORDLLTEST_1_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$SORDLLTEST_1_TEST' output: $SORDLLTEST_1_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$SORDLLTEST_1_EXPECTED" = "$SORDLLTEST_1_RESULT" ]; 

then 
	echo "$SORDLLTEST_1_TEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST_1 / $SORDLLTEST_1" >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST_1))
	
else
	echo "SORDLLTEST_1_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST_1" >> $SCRIPT_OUT
	
fi

#######################
# SORDLLTEST_2 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

SORDLLTEST_2_RESULT=$( $SORDLLTEST_2_TEST )

echo "Expected '$SORDLLTEST_2_TEST' output: $SORDLLTEST_2_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$SORDLLTEST_2_TEST' output: $SORDLLTEST_2_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$SORDLLTEST_2_EXPECTED" = "$SORDLLTEST_2_RESULT" ]; 

then 
	echo "$SORDLLTEST_2_TEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST_2 / $SORDLLTEST_2" >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST_2))
	
else
	echo "SORDLLTEST_2_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST_2" >> $SCRIPT_OUT
	
fi


#######################
# SORDLLTEST_3 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

SORDLLTEST_3_RESULT=$( $SORDLLTEST_3_TEST )

echo "Expected '$SORDLLTEST_3_TEST' output: $SORDLLTEST_3_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$SORDLLTEST_3_TEST' output: $SORDLLTEST_3_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$SORDLLTEST_3_EXPECTED" = "$SORDLLTEST_3_RESULT" ]; 

then 
	echo "$SORDLLTEST_3_TEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST_3 / $SORDLLTEST_3" >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST_3))
	
else
	echo "SORDLLTEST_3_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST_3" >> $SCRIPT_OUT
	
fi


#######################
# SORDLLTEST_4 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

SORDLLTEST_4_RESULT=$( $SORDLLTEST_4_TEST )

echo "Expected '$SORDLLTEST_4_TEST' output: $SORDLLTEST_4_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$SORDLLTEST_4_TEST' output: $SORDLLTEST_4_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$SORDLLTEST_4_EXPECTED" = "$SORDLLTEST_4_RESULT" ]; 

then 
	echo "$SORDLLTEST_4_TEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST_4 / $SORDLLTEST_4" >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST_4))
	
else
	echo "SORDLLTEST_4_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST_4" >> $SCRIPT_OUT
	
fi


#######################
# SORDLLTEST_5 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

SORDLLTEST_5_RESULT=$( $SORDLLTEST_5_TEST )

echo "Expected '$SORDLLTEST_5_TEST' output: $SORDLLTEST_5_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$SORDLLTEST_5_TEST' output: $SORDLLTEST_5_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$SORDLLTEST_5_EXPECTED" = "$SORDLLTEST_5_RESULT" ]; 

then 
	echo "$SORDLLTEST_5_TEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST_5 / $SORDLLTEST_5" >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST_5))
	
else
	echo "SORDLLTEST_5_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST_5" >> $SCRIPT_OUT
	
fi


#######################
# SORDLLTEST_6 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

SORDLLTEST_6_RESULT=$( $SORDLLTEST_6_TEST )

echo "Expected '$SORDLLTEST_6_TEST' output: $SORDLLTEST_6_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$SORDLLTEST_6_TEST' output: $SORDLLTEST_6_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$SORDLLTEST_6_EXPECTED" = "$SORDLLTEST_6_RESULT" ]; 

then 
	echo "$SORDLLTEST_6_TEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST_6  / $SORDLLTEST_6 " >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST_6 ))
	
else
	echo "SORDLLTEST_6_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST_6 " >> $SCRIPT_OUT
	
fi


#######################
# SORDLLTEST_7 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

SORDLLTEST_7_RESULT=$( $SORDLLTEST_7_TEST )

echo "Expected '$SORDLLTEST_7_TEST' output: $SORDLLTEST_7_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$SORDLLTEST_7_TEST' output: $SORDLLTEST_7_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$SORDLLTEST_7_EXPECTED" = "$SORDLLTEST_7_RESULT" ]; 

then 
	echo "$SORDLLTEST_7_TEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST_7 / $SORDLLTEST_7" >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST_7))
	
else
	echo "SORDLLTEST_7_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST_7" >> $SCRIPT_OUT
	
fi


#######################
# SORDLLTEST_8 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

SORDLLTEST_8_RESULT=$( $SORDLLTEST_8_TEST )

echo "Expected '$SORDLLTEST_8_TEST' output: $SORDLLTEST_8_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$SORDLLTEST_8_TEST' output: $SORDLLTEST_8_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$SORDLLTEST_8_EXPECTED" = "$SORDLLTEST_8_RESULT" ]; 

then 
	echo "$SORDLLTEST_8_TEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST_8 / $SORDLLTEST_8" >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST_8))
	
else
	echo "SORDLLTEST_8_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST_8" >> $SCRIPT_OUT
	
fi


#######################
# SORDLLTEST_9 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

SORDLLTEST_9_RESULT=$( $SORDLLTEST_9_TEST )

echo "Expected '$SORDLLTEST_9_TEST' output: $SORDLLTEST_9_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$SORDLLTEST_9_TEST' output: $SORDLLTEST_9_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$SORDLLTEST_9_EXPECTED" = "$SORDLLTEST_9_RESULT" ]; 

then 
	echo "$SORDLLTEST_9_TEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST_9 / $SORDLLTEST_9" >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST_9))
	
else
	echo "SORDLLTEST_9_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST_9" >> $SCRIPT_OUT
	
fi


#######################
# SORDLLTEST_10 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

SORDLLTEST_10_RESULT=$( $SORDLLTEST_10_TEST )

echo "Expected '$SORDLLTEST_10_TEST' output: $SORDLLTEST_10_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$SORDLLTEST_10_TEST' output: $SORDLLTEST_10_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$SORDLLTEST_10_EXPECTED" = "$SORDLLTEST_10_RESULT" ]; 

then 
	echo "$SORDLLTEST_10_TEST test passed" >> $SCRIPT_OUT
	echo "$SORDLLTEST_10  / $SORDLLTEST_10 " >> $SCRIPT_OUT
	((STUDENT_GRADE += $SORDLLTEST_10 ))
	
else
	echo "SORDLLTEST_10_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $SORDLLTEST_10 " >> $SCRIPT_OUT
	
fi


############################################################
# Running ./PQTest tests
############################################################

# streams tests 
PQTEST_1_TEST="./exe/PQTest"
PQTEST_1_EXPECTED="Incorrect number of inputs"

PQTEST_2_TEST="./exe/PQTest 1"
PQTEST_2_EXPECTED="1 "

PQTEST_3_TEST="./exe/PQTest 1 10"
PQTEST_3_EXPECTED="10 1 "

PQTEST_4_TEST="./exe/PQTest 10 1 3"
PQTEST_4_EXPECTED="10 3 1 "

PQTEST_5_TEST="./exe/PQTest 4 7 3 10 22"
PQTEST_5_EXPECTED="22 10 7 4 3 "

PQTEST_6_TEST="./exe/PQTest 1 2 3 4 5 6 7"
PQTEST_6_EXPECTED="7 6 5 4 3 2 1 "

PQTEST_7_TEST="./exe/PQTest -1 -2 -3 -4 -5 -6 -7"
PQTEST_7_EXPECTED="-1 -2 -3 -4 -5 -6 -7 "

PQTEST_8_TEST="./exe/PQTest -7 -6 -5 -4 -3 -2 -1"
PQTEST_8_EXPECTED="-1 -2 -3 -4 -5 -6 -7 "

PQTEST_9_TEST="./exe/PQTest 14 1 13 2 12 3 11 4 10 5 9 6 8 7"
PQTEST_9_EXPECTED="14 13 12 11 10 9 8 7 6 5 4 3 2 1 "

PQTEST_10_TEST="./exe/PQTest 44 4 34 14 24 14 4"
PQTEST_10_EXPECTED="44 34 24 14 14 4 4 "

#######################
# Test the make PQTest command 
#######################

PQTEST="make PQTest"

PQTEST_EXPECTED_FIRST="g++ -m64 -std=c++11 -Weffc++ -O0 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -c src/PQTest.cpp -o obj/PQTest.o"
PQTEST_EXPECTED_SECOND="g++ -m64 -std=c++11 -Weffc++ -O0 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -o exe/PQTest obj/PQTest.o"

# Clean the object files and then run the test 
make clean >> $REDIRECT

# Run the make command and get the result 
PQTEST_RESULT=$( $PQTEST )

# Send results to the script
echo "Expected $PQTEST output: " >> $SCRIPT_OUT 
echo $PQTEST_EXPECTED_FIRST >> $SCRIPT_OUT 
echo $PQTEST_EXPECTED_SECOND >> $SCRIPT_OUT 
echo "Actual $PQTEST output  : " >> $SCRIPT_OUT 
echo $PQTEST_RESULT >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

echo $PQTEST_RESULT >> $REDIRECT

# Add points to overall score or mark as 0 if not for make lucky
if grep -q "$PQTEST_EXPECTED_FIRST" $REDIRECT && grep -q "$PQTEST_EXPECTED_SECOND" $REDIRECT 

then 
	echo "$PQTEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE / $PQ_TEST_SCORE" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE))
	
else
	echo "$PQTEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# PQTEST_1 Test
#######################

# Need to re-compile on first test since $( $PQTEST ) automatically deletes executable
$PQTEST > $REDIRECT

# Run the test and save the output 
PQTEST_1_RESULT=$( $PQTEST_1_TEST )

echo "Expected '$PQTEST_1_TEST' output: $PQTEST_1_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PQTEST_1_TEST' output: $PQTEST_1_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PQTEST_1_EXPECTED" = "$PQTEST_1_RESULT" ]; 

then 
	echo "$PQTEST_1_TEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE_1 / $PQ_TEST_SCORE_1" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE_1))
	
else
	echo "PQTEST_1_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE_1" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

#######################
# PQTEST_2 Test
#######################


PQTEST_2_RESULT=$( $PQTEST_2_TEST )

echo "Expected '$PQTEST_2_TEST' output: $PQTEST_2_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PQTEST_2_TEST' output: $PQTEST_2_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PQTEST_2_EXPECTED" = "$PQTEST_2_RESULT" ]; 

then 
	echo "$PQTEST_2_TEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE_2 / $PQ_TEST_SCORE_2" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE_2))
	
else
	echo "PQTEST_2_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE_2" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# PQTEST_3 Test
#######################

PQTEST_3_RESULT=$( $PQTEST_3_TEST )

echo "Expected '$PQTEST_3_TEST' output: $PQTEST_3_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PQTEST_3_TEST' output: $PQTEST_3_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PQTEST_3_EXPECTED" = "$PQTEST_3_RESULT" ]; 

then 
	echo "$PQTEST_3_TEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE_3 / $PQ_TEST_SCORE_3" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE_3))
	
else
	echo "PQTEST_3_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE_3" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# PQTEST_4 Test
#######################

PQTEST_4_RESULT=$( $PQTEST_4_TEST )

echo "Expected '$PQTEST_4_TEST' output: $PQTEST_4_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PQTEST_4_TEST' output: $PQTEST_4_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PQTEST_4_EXPECTED" = "$PQTEST_4_RESULT" ]; 

then 
	echo "$PQTEST_4_TEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE_4 / $PQ_TEST_SCORE_4" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE_4))
	
else
	echo "PQTEST_4_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE_4" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# PQTEST_5 Test
#######################

PQTEST_5_RESULT=$( $PQTEST_5_TEST )

echo "Expected '$PQTEST_5_TEST' output: $PQTEST_5_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PQTEST_5_TEST' output: $PQTEST_5_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PQTEST_5_EXPECTED" = "$PQTEST_5_RESULT" ]; 

then 
	echo "$PQTEST_5_TEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE_5 / $PQ_TEST_SCORE_5" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE_5))
	
else
	echo "PQTEST_5_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE_5" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# PQTEST_6 Test
#######################

PQTEST_6_RESULT=$( $PQTEST_6_TEST )

echo "Expected '$PQTEST_6_TEST' output: $PQTEST_6_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PQTEST_6_TEST' output: $PQTEST_6_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PQTEST_6_EXPECTED" = "$PQTEST_6_RESULT" ]; 

then 
	echo "$PQTEST_6_TEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE_6 / $PQ_TEST_SCORE_6" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE_6))
	
else
	echo "PQTEST_6_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE_6" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# PQTEST_7 Test
#######################

PQTEST_7_RESULT=$( $PQTEST_7_TEST )

echo "Expected '$PQTEST_7_TEST' output: $PQTEST_7_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PQTEST_7_TEST' output: $PQTEST_7_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PQTEST_7_EXPECTED" = "$PQTEST_7_RESULT" ]; 

then 
	echo "$PQTEST_7_TEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE_7 / $PQ_TEST_SCORE_7" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE_7))
	
else
	echo "PQTEST_7_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE_7" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# PQTEST_8 Test
#######################

PQTEST_8_RESULT=$( $PQTEST_8_TEST )

echo "Expected '$PQTEST_8_TEST' output: $PQTEST_8_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PQTEST_8_TEST' output: $PQTEST_8_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PQTEST_8_EXPECTED" = "$PQTEST_8_RESULT" ]; 

then 
	echo "$PQTEST_8_TEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE_8 / $PQ_TEST_SCORE_8" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE_8))
	
else
	echo "PQTEST_8_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE_8" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# PQTEST_9 Test
#######################

PQTEST_9_RESULT=$( $PQTEST_9_TEST )

echo "Expected '$PQTEST_9_TEST' output: $PQTEST_9_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PQTEST_9_TEST' output: $PQTEST_9_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PQTEST_9_EXPECTED" = "$PQTEST_9_RESULT" ]; 

then 
	echo "$PQTEST_9_TEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE_9 / $PQ_TEST_SCORE_9" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE_9))
	
else
	echo "PQTEST_9_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE_9" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# PQTEST_10 Test
#######################

PQTEST_10_RESULT=$( $PQTEST_10_TEST )

echo "Expected '$PQTEST_10_TEST' output: $PQTEST_10_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PQTEST_10_TEST' output: $PQTEST_10_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PQTEST_10_EXPECTED" = "$PQTEST_10_RESULT" ]; 

then 
	echo "$PQTEST_10_TEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE_10 / $PQ_TEST_SCORE_10" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE_10))
	
else
	echo "PQTEST_10_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE_10" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT



#######################
# Test the make PrinterTest command 
#######################

PRINTERTEST="make PrinterTest"

PRINTERTEST_EXPECTED_FIRST="g++ -m64 -std=c++11 -Weffc++ -O0 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -c src/PrinterTest.cpp -o obj/PrinterTest.o"
PRINTERTEST_EXPECTED_SECOND="g++ -m64 -std=c++11 -Weffc++ -O0 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -c src/Printer.cpp -o obj/Printer.o"
PRINTERTEST_EXPECTED_THIRD="g++ -m64 -std=c++11 -Weffc++ -O0 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -o exe/PrinterTest obj/PrinterTest.o obj/Printer.o"

# Clean the object files and then run the test 
make clean >> $REDIRECT

# Run the make command and get the result 
PRINTERTEST_RESULT=$( $PRINTERTEST )

# Send results to the script
echo "Expected $PRINTERTEST output: " >> $SCRIPT_OUT 
echo $PRINTERTEST_EXPECTED_FIRST >> $SCRIPT_OUT 
echo $PRINTERTEST_EXPECTED_SECOND >> $SCRIPT_OUT
echo $PRINTERTEST_EXPECTED_THIRD >> $SCRIPT_OUT 
echo "Actual $PRINTERTEST output  : " >> $SCRIPT_OUT 
echo $PRINTERTEST_RESULT >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

echo $PRINTERTEST_RESULT >> $REDIRECT

# Add points to overall score or mark as 0 if not for make lucky
if grep -q "$PRINTERTEST_EXPECTED_FIRST" $REDIRECT && grep -q "$PRINTERTEST_EXPECTED_SECOND" $REDIRECT && grep -q "$PRINTERTEST_EXPECTED_THIRD" $REDIRECT 

then 
	echo "$PRINTERTEST test passed" >> $SCRIPT_OUT
	echo "$PQ_TEST_SCORE / $PQ_TEST_SCORE" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PQ_TEST_SCORE))
	
else
	echo "$PRINTERTEST test failed" >> $SCRIPT_OUT
	echo "0 / $PQ_TEST_SCORE" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# PRINTERTEST_1 Test
#######################

PRINTERTEST_1_TEST="./exe/PrinterTest PrinterTest.txt"
PRINTERTEST_1_EXPECTED="Pages = 6, Job = Bui_Job
Pages = 10, Job = Morrison_Job
Pages = 14, Job = Brockman_Job
Pages = 19, Job = Bui_Job_2
Pages = 34, Job = Morrison_Job_2
Pages = 44, Job = Ramzi_Job
Pages = 431, Job = Dissertation"

# Need to re-compile on first test since $( $PRINTERTEST ) automatically deletes executable
$PRINTERTEST > $REDIRECT

# Run the test and save the output 
PRINTERTEST_1_RESULT=$( $PRINTERTEST_1_TEST )

echo "Expected '$PRINTERTEST_1_TEST' output: $PRINTERTEST_1_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$PRINTERTEST_1_TEST' output: $PRINTERTEST_1_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$PRINTERTEST_1_EXPECTED" = "$PRINTERTEST_1_RESULT" ]; 

then 
	echo "$PRINTERTEST_1_TEST test passed" >> $SCRIPT_OUT
	echo "$PRINTER_TEST_SCORE / $PRINTER_TEST_SCORE" >> $SCRIPT_OUT
	((STUDENT_GRADE += $PRINTER_TEST_SCORE))
	
else
	echo "PRINTERTEST_1_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $PRINTER_TEST_SCORE" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


# Final Grade to both the screen and the script file.
echo "-----------------------------" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "CC04 Coding Portion Grade for $STUDENT_NAME ($STUDENT_ID): $STUDENT_GRADE / $TOTAL " >> $SCRIPT_OUT
echo "CC04 Coding Portion Grade for $STUDENT_NAME ($STUDENT_ID): $STUDENT_GRADE / $TOTAL "
echo "Run 'vim $SCRIPT_OUT' to see the result of the test script"


# Clean and delete re-directions
make clean > $REDIRECT

rm $REDIRECT