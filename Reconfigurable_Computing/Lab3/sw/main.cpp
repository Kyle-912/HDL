// Greg Stitt
// University of Florida
// main.cpp
//

#include <iostream>
#include <cstdlib>
#include <cassert>
#include <cstring>
#include <cstdio>
#include <vector>

#include "Board.h"

using namespace std;

enum mmapAddr
{
  GO_ADDR = 0,
  N_ADDR,
  RESULT_ADDR,
  DONE_ADDR
};

int fib(int n)
{
  
}

int main(int argc, char *argv[])
{

  if (argc != 2)
  {
    cerr << "Usage: " << argv[0] << " bitfile" << endl;
    return -1;
  }

  vector<float> clocks(Board::NUM_FPGA_CLOCKS);
  clocks[0] = 100.0;
  clocks[1] = 100.0;
  clocks[2] = 100.0;
  clocks[3] = 100.0;

  cout << "Programming FPGA...." << endl;

  // initialize board
  Board *board;
  try
  {
    board = new Board(argv[1], clocks);
  }
  catch (...)
  {
    exit(-1);
  }

  // TODO: Create a loop that tests the software and hardware FIB
  // Use the output format specified in the lab instructions.
  //
  // To check for the done signal, do not use your own for/while loop.
  // Instead, use the board->waitUntilNotZero function.
  //
  // e.g. board->waitUntilNotZero(DONE_ADDR, 2.0);
  //
  // This function takes an MMIO address and a timeout value (in seconds).
  // The function will continually read from the specified address,
  // until the returned value is non-zero, or until the timeout occurs.
  // If the timeout occurs, the function throws a TimeoutException.

  for (int i = 0; i < 48; i++)
  {
  }

  return 0;
}
