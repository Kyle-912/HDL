Group Members:
1. Shiva Jyothi Mallidi(UFID: 75384078)
2. Kyle Thompson(UFID: 30130224)

We could not resolve the issue where the waitUntilNotZero function is throwing the TimeoutException. It is doing this despite the done input in memory_map.vhd being asserted when expected which should then be written to the rd_data output and accessed the same way the result input is. Reading the values of the results works fine so we're not sure why reading done isn't behaving the exact same. To be able to generate the output file we commented out the exception throwing lines of code in Board.cpp and then the code runs as intended. If you could let us know what we're did wrong we would greatly appreciate it