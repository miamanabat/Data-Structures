#!/bin/sh
# Grading script developed by Matthew Morrison
# Spring 2021 - Data Structures - Lab 08 - Grading Script

# Variables for the script
SCRIPT_OUT="grade.out"
REDIRECT="redirect.out"

# Point Breakdown Variables
STUDENT_GRADE=0
TOTAL=100
ALIEN_TEST=15
LAB8_TEST_1_SCORE=18
ALIEN2_TEST=15
LAB8_TEST_2_SCORE=18
ALIEN3_TEST=15
LAB8_TEST_3_SCORE=19


# Delete the script.out so student can test multiple times
# and we can still use >> to append while running a test
if test -f $SCRIPT_OUT; then
    rm $SCRIPT_OUT
fi

# Write initial messages to the output file
INTRO_MESSAGE="Grading script for Lab 08"
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
# Test the make Alien command 
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing make Alien" >> $SCRIPT_OUT

make clean >> $SCRIPT_OUT

# make decode comparison variables
MAKE_ALIEN_TEST="make Alien"
MAKE_ALIEN_TEST_EXPECTED_FIRST="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -c src/Alien.cpp -o obj/Alien.o"
MAKE_ALIEN_TEST_EXPECTED_SECOND="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -o exe/Alien obj/Alien.o"
MAKE_ALIEN_TEST_RESULT=$( $MAKE_ALIEN_TEST )

# Delete redirect and send make result to redirect 

echo $MAKE_ALIEN_TEST_RESULT >> $REDIRECT

# Send results to the script
echo "Expected $MAKE_ALIEN_TEST output: " >> $SCRIPT_OUT
echo $MAKE_ALIEN_TEST_EXPECTED_FIRST >> $SCRIPT_OUT
echo $MAKE_ALIEN_TEST_EXPECTED_SECOND >> $SCRIPT_OUT
echo "Actual $MAKE_ALIEN_TEST output  : " >> $SCRIPT_OUT
echo $MAKE_ALIEN_TEST_RESULT >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Add points to overall score or mark as 0 if not for make lucky

if grep -q "$MAKE_ALIEN_TEST_EXPECTED_FIRST" $REDIRECT && grep -q "$MAKE_ALIEN_TEST_EXPECTED_SECOND" $REDIRECT

then 
	echo "$MAKE_ALIEN_TEST test passed" >> $SCRIPT_OUT
	echo "$ALIEN_TEST / $ALIEN_TEST" >> $SCRIPT_OUT
	((STUDENT_GRADE += $ALIEN_TEST))
	
else
	echo "$MAKE_ALIEN_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DH_TEST" >> $SCRIPT_OUT
	
fi

############################################################
# Running exe/./Alien tests
############################################################

# Alien tests 
LAB8_TEST_1="exe/./Alien"
LAB8_TEST_1_EXPECTED="Alien Words: wt wrf er ett eftt wer 

Parent Array Values:
w -1
t 3
r 4
f 2
e 0"


echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing Alien program" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# LAB8_TEST_1 Test
#######################

# Need to re-compile on first test since $( $MAKE_ALIEN_TEST ) automatically deletes executable
$MAKE_ALIEN_TEST > $REDIRECT
LAB8_TEST_1_RESULT=$( $LAB8_TEST_1 )

echo "Expected '$LAB8_TEST_1' output: $LAB8_TEST_1_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$LAB8_TEST_1' output: $LAB8_TEST_1_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$LAB8_TEST_1_EXPECTED" = "$LAB8_TEST_1_RESULT" ]; 

then 
	echo "$LAB8_TEST_1 test passed" >> $SCRIPT_OUT
	echo "$LAB8_TEST_1_SCORE / $LAB8_TEST_1_SCORE" >> $SCRIPT_OUT
	((STUDENT_GRADE += $LAB8_TEST_1_SCORE))
	
else
	echo "LAB8_TEST_1 test failed" >> $SCRIPT_OUT
	echo "0 / $LAB8_TEST_1_SCORE" >> $SCRIPT_OUT
	
fi



#######################
# Test the make Alien2 command 
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing make Alien2" >> $SCRIPT_OUT

make clean >> $SCRIPT_OUT

# make decode comparison variables
MAKE_ALIEN2_TEST="make Alien2"
MAKE_ALIEN2_TEST_EXPECTED_FIRST="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -c src/Alien2.cpp -o obj/Alien2.o"
MAKE_ALIEN2_TEST_EXPECTED_SECOND="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -o exe/Alien2 obj/Alien2.o"
MAKE_ALIEN2_TEST_RESULT=$( $MAKE_ALIEN2_TEST )

# Delete redirect and send make result to redirect 

echo $MAKE_ALIEN2_TEST_RESULT >> $REDIRECT

# Send results to the script
echo "Expected $MAKE_ALIEN2_TEST output: " >> $SCRIPT_OUT
echo $MAKE_ALIEN2_TEST_EXPECTED_FIRST >> $SCRIPT_OUT
echo $MAKE_ALIEN2_TEST_EXPECTED_SECOND >> $SCRIPT_OUT
echo "Actual $MAKE_ALIEN2_TEST output  : " >> $SCRIPT_OUT
echo $MAKE_ALIEN2_TEST_RESULT >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Add points to overall score or mark as 0 if not for make lucky

if grep -q "$MAKE_ALIEN2_TEST_EXPECTED_FIRST" $REDIRECT && grep -q "$MAKE_ALIEN2_TEST_EXPECTED_SECOND" $REDIRECT

then 
	echo "$MAKE_ALIEN2_TEST test passed" >> $SCRIPT_OUT
	echo "$ALIEN_TEST / $ALIEN_TEST" >> $SCRIPT_OUT
	((STUDENT_GRADE += $ALIEN_TEST))
	
else
	echo "$MAKE_ALIEN2_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $DH_TEST" >> $SCRIPT_OUT
	
fi

############################################################
# Running exe/./Alien2 tests
############################################################

# Alien tests 
LAB8_TEST_2="exe/./Alien2"
LAB8_TEST_2_EXPECTED="Alien Words: eftt wer wt wrf ett er 

Parent Array Values:
e 3
f 4
t 1
w -1
r 0"


echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing Alien2 program" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# LAB8_TEST_2 Test
#######################

# Need to re-compile on first test since $( $MAKE_ALIEN2_TEST ) automatically deletes executable
$MAKE_ALIEN2_TEST > $REDIRECT
LAB8_TEST_2_RESULT=$( $LAB8_TEST_2 )

echo "Expected '$LAB8_TEST_2' output: $LAB8_TEST_2_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$LAB8_TEST_2' output: $LAB8_TEST_2_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$LAB8_TEST_2_EXPECTED" = "$LAB8_TEST_2_RESULT" ]; 

then 
	echo "$LAB8_TEST_2 test passed" >> $SCRIPT_OUT
	echo "$LAB8_TEST_2_SCORE / $LAB8_TEST_2_SCORE" >> $SCRIPT_OUT
	((STUDENT_GRADE += $LAB8_TEST_2_SCORE))
	
else
	echo "LAB8_TEST_2 test failed" >> $SCRIPT_OUT
	echo "0 / $LAB8_TEST_2_SCORE" >> $SCRIPT_OUT
	
fi



#######################
# Test the make Alien3 command 
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing make Alien3" >> $SCRIPT_OUT

make clean >> $SCRIPT_OUT

# make decode comparison variables
MAKE_ALIEN3_TEST="make Alien3"
MAKE_ALIEN3_TEST_EXPECTED_FIRST="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -c src/Alien3.cpp -o obj/Alien3.o"
MAKE_ALIEN3_TEST_EXPECTED_SECOND="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -o exe/Alien3 obj/Alien3.o"
MAKE_ALIEN3_TEST_RESULT=$( $MAKE_ALIEN3_TEST )

# Delete redirect and send make result to redirect 

echo $MAKE_ALIEN3_TEST_RESULT >> $REDIRECT

# Send results to the script
echo "Expected $MAKE_ALIEN3_TEST output: " >> $SCRIPT_OUT
echo $MAKE_ALIEN3_TEST_EXPECTED_FIRST >> $SCRIPT_OUT
echo $MAKE_ALIEN3_TEST_EXPECTED_SECOND >> $SCRIPT_OUT
echo "Actual $MAKE_ALIEN3_TEST output  : " >> $SCRIPT_OUT
echo $MAKE_ALIEN3_TEST_RESULT >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Add points to overall score or mark as 0 if not for make lucky

if grep -q "$MAKE_ALIEN3_TEST_EXPECTED_FIRST" $REDIRECT && grep -q "$MAKE_ALIEN3_TEST_EXPECTED_SECOND" $REDIRECT

then 
	echo "$MAKE_ALIEN3_TEST test passed" >> $SCRIPT_OUT
	echo "$ALIEN3_TEST / $ALIEN3_TEST" >> $SCRIPT_OUT
	((STUDENT_GRADE += $ALIEN3_TEST))
	
else
	echo "$MAKE_ALIEN3_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $ALIEN3_TEST" >> $SCRIPT_OUT
	
fi

############################################################
# Running exe/./Alien3 tests
############################################################

# Alien tests 
LAB8_TEST_3="exe/./Alien3"
LAB8_TEST_3_EXPECTED="Alien Words: wt werfghabit 

Parent Array Values:
w -1
t 9
e 0
r 2
f 3
g 4
h 5
a 6
b 7
i 8"


echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing Alien3 program" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# LAB8_TEST_3 Test
#######################

# Need to re-compile on first test since $( $MAKE_ALIEN3_TEST ) automatically deletes executable
$MAKE_ALIEN3_TEST > $REDIRECT
LAB8_TEST_3_RESULT=$( $LAB8_TEST_3 )

echo "Expected '$LAB8_TEST_3' output: $LAB8_TEST_3_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$LAB8_TEST_3' output: $LAB8_TEST_3_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$LAB8_TEST_3_EXPECTED" = "$LAB8_TEST_3_RESULT" ]; 

then 
	echo "$LAB8_TEST_3 test passed" >> $SCRIPT_OUT
	echo "$LAB8_TEST_3_SCORE / $LAB8_TEST_3_SCORE" >> $SCRIPT_OUT
	((STUDENT_GRADE += $LAB8_TEST_3_SCORE))
	
else
	echo "LAB8_TEST_3 test failed" >> $SCRIPT_OUT
	echo "0 / $LAB8_TEST_3_SCORE" >> $SCRIPT_OUT
	
fi


# Final Grade to both the screen and the script file.
echo "-----------------------------" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "Lab 08 Grade for $STUDENT_NAME ($STUDENT_ID): $STUDENT_GRADE / $TOTAL " >> $SCRIPT_OUT
echo "Lab 08 Grade for $STUDENT_NAME ($STUDENT_ID): $STUDENT_GRADE / $TOTAL "
echo "Run 'vim $SCRIPT_OUT' to see the result of the test script"


# Clean and delete re-directions
make clean > $REDIRECT

rm $REDIRECT
