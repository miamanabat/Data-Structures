mkdir src inc
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/Makefile
make initialize
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/PrinterTest.txt
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/test.sh
chmod a+rx test.sh
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/inc/DLList.h
cp DLList.h inc/DLList.h
rm DLList.h
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/inc/PriorityQueue.h
cp PriorityQueue.h inc/PriorityQueue.h
rm PriorityQueue.h
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/inc/Printer.h
cp Printer.h inc/Printer.h
rm Printer.h
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/inc/Node.h
cp Node.h inc/Node.h
rm Node.h
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/src/PQTest.cpp
cp PQTest.cpp src/PQTest.cpp
rm PQTest.cpp
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/src/Printer.cpp
cp Printer.cpp src/Printer.cpp
rm Printer.cpp
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/src/PrinterTest.cpp
cp PrinterTest.cpp src/PrinterTest.cpp
rm PrinterTest.cpp
wget https://raw.githubusercontent.com/mmorri22/sp21-cse-20312/main/CC04/src/SorDLLTest.cpp
cp SorDLLTest.cpp src/SorDLLTest.cpp
rm SorDLLTest.cpp
