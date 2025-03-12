# Using Spatial Locality for Memory Access and the Effect of -O3 Compiler Optimization:

High-performance computing is the primary concern in many applications, and one of the main bottlenecks is accessing main memory and disk memory. To alleviate this issue, the memory system, including DRAM and caches, has continuously advanced.

Some Advances in DRAM:

The introduction of synchronous dynamic random-access memory (SDRAM) reduced the overhead of repeated access and added the burst transfer mode and bank. The addition of burst mode enabled the transfer of multiple data with one request, and the integration of the bank in the DRAM reduced the power consumption and allowed overlapped accesses.

The addition of the double data rate (DDR) to the DRAM doubled the peak data rate.

Some Advances in Cache System:

The multi-level cache system is added to the memory system to fill the speed cap between the memory and CPU cores. The performance and bandwidth of the caches are improved by the addition of the pipeline, multibank, set-associativity, and way prediction.

The non-blocking caches are now common in the cache system allowing the processor to execute new instructions on the out-of-order processor in the presence of the cache misses.

Spatial Locality in Memory Access:

Due to the burst mode and data transfer from memory to the caches in chunks (cache line size), the performance will be improved when we access the memory sequentially (next to each other) in the code. 

The provided sample code demonstrates the effect of continuous and non-continuous memory access. The compiled code with the optimization of -O0 on my system shows a 9× speed-up when contiguous memory access is used.

Compiler Optimization:

The compiler flags allow compile-time optimization, and the compilers with the knowledge of the memory system use SIMD instructions available in the system to optimize a non-optimized code to some extent.

Using the -O3 flag for the previous test allows the compiler to use SIMD instructions (movdqa and movaps available on my system), SSE registers (xmm0 available on my system), and loop unrolling to optimize the code.

With the -O3 flag, both loops execute with comparable performance.


---

### Generating Assembly

To generate assembly with optimization level **-O3**:

g++ -std=c++23 -O3 -S main.cpp -o main3.asm

To generate assembly with optimization level -O0 (no optimization):

g++ -std=c++23 -O0 -S main.cpp -o main0.asm