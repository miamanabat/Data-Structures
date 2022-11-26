mkdir src inc
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/Lab11/Makefile
make initialize
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/Lab11/test.sh
chmod a+rx test.sh
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/Lab11/src/Prob1.cpp
cp Prob1.cpp src/Prob1.cpp
rm Prob1.cpp
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/Lab11/src/Prob2.cpp
cp Prob2.cpp src/Prob2.cpp
rm Prob2.cpp
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/Lab11/src/SubsetSums.cpp
cp SubsetSums.cpp src/SubsetSums.cpp
rm SubsetSums.cpp