#include "../inc/BSTNode.h"
#include <iostream>
#include <algorithm>

#define COUT std::cout
#define ENDL std::endl

int Max( int a, int b ){
	
	return a > b ? a : b;
	
}

int MaxPathFunc( BSTNode<int>* currNode, int& maxPathSum ){
	
	/* Lab 9 starts here */
	// if the node is NULL, return 0
	if (currNode == NULL){
		return 0;
	}

	// here, we return the maximum path sum originating from the left child
	int left = MaxPathFunc(currNode->left, maxPathSum);

	// here, we return the meaximum path originating from the left child
	int right = MaxPathFunc(currNode->right, maxPathSum);

	/* Now we have all the info for the four cases */

	//Case 1 - what's bigger, the current maxPathSum of just the current node's data
	maxPathSum = Max(maxPathSum, currNode->data);

	//case 2 - what's bigger the current maxPathSum of just the current node's data plus the left result
	maxPathSum = Max(maxPathSum, currNode->data + left);

	//case 3 - what's bigger, the current maxpathSum of just the current node's data plus the right result
	maxPathSum = Max(maxPathSum, currNode->data + right);

	//case 4 - what's bigger, the current maxPathSum of just the current node's data plus the left result
	maxPathSum = Max(maxPathSum, currNode->data + left + right);

	// in order to provide info for cases 2, 3, 4- return the greater of the current data and 
	// the sum of the current data and the maximum of the left and right
	return Max(currNode->data, currNode->data + Max(left, right));

}

void test1(){
	
    COUT << "----- TEST 1 -----" << ENDL;
    BSTNode<int> node0(-10);
	node0.left = new BSTNode<int>(9);
	node0.right = new BSTNode<int>(20);

	node0.right->left = new BSTNode<int>(15);
	node0.right->right = new BSTNode<int>(7);
	
	int res = 0;
	
	MaxPathFunc( &node0, res );
	
	COUT << "The Maximum Path Sum is " << res << ENDL << ENDL;
	
	
}

void test2(){
	
    COUT << "----- TEST 2 -----" << ENDL;
    BSTNode<int> node0(2);
	node0.left = new BSTNode<int>(1);
	node0.right = new BSTNode<int>(3);
	
	int res = 0;
	
	MaxPathFunc( &node0, res );
	
	COUT << "The Maximum Path Sum is " << res << ENDL << ENDL;
	
	
}

void test4(){
	
    COUT << "----- TEST 4 -----" << ENDL;
    BSTNode<int> node0(20);
	node0.left = new BSTNode<int>(-9);
	node0.right = new BSTNode<int>(-20);

	node0.right->left = new BSTNode<int>(-15);
	node0.right->right = new BSTNode<int>(7);

	int res = 0;
	
	MaxPathFunc( &node0, res );
	
	COUT << "The Maximum Path Sum is " << res << ENDL << ENDL;
	
	
}


void test3(){
	
    COUT << "----- TEST 3 -----" << ENDL;
    BSTNode<int> node0(10);
	node0.left = new BSTNode<int>(9);
	node0.right = new BSTNode<int>(20);

	node0.right->left = new BSTNode<int>(15);
	node0.right->right = new BSTNode<int>(-7);

	int res = 0;
	
	MaxPathFunc( &node0, res );
	
	COUT << "The Maximum Path Sum is " << res << ENDL << ENDL;
	
	
}


void test5(){
	
    COUT << "----- TEST 5 -----" << ENDL;
    BSTNode<int> node0(30);
	node0.left = new BSTNode<int>(-8);
	node0.right = new BSTNode<int>(20);
	
	node0.right->left = new BSTNode<int>(-9);
	node0.right->right = new BSTNode<int>(-20);

	node0.right->right->left = new BSTNode<int>(-15);
	node0.right->right->right = new BSTNode<int>(7);

	int res = 0;
	
	MaxPathFunc( &node0, res );
	
	COUT << "The Maximum Path Sum is " << res << ENDL << ENDL;
	
}


void test6(){
	
    COUT << "----- TEST 6 -----" << ENDL;
    BSTNode<int> node0(30);
	node0.left = new BSTNode<int>(11);
	node0.right = new BSTNode<int>(-20);
	
	node0.right->left = new BSTNode<int>(-9);
	node0.right->right = new BSTNode<int>(19);

	node0.right->right->left = new BSTNode<int>(23);
	node0.right->right->right = new BSTNode<int>(23);

	int res = 0;
	
	MaxPathFunc( &node0, res );
	
	COUT << "The Maximum Path Sum is " << res << ENDL << ENDL;
	
	
}


int main(){
    
	test1();
	
	test2();
	
	test3();
	
	test4();
	
	test5();
	
	test6();
	
	return 0;
}
