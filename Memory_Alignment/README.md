# Allocating Aligned Memory:

The intrinsic routines are available for each architecture, such as vector and load/store registers. They are used to improve the performance of code sections that exhibit the Single Instruction Multiple Data (SIMD) pattern. 

If the data loaded to the vector registers is aligned, better performance can be obtained.

There are different functions for allocating aligned memory on the CPU.

## The Standard C++ Library:

The Standard C++ Library introduced the aligned_alloc(alignment, size) function in C++17. It allocates size bytes of uninitialized aligned memory.

The size must be an integral multiple of the alignment.

The allocated memory must be released by the std::free() function.

## Intel's intrinsic library:

Intel's intrinsic library provides two functions for allocating aligned memory. The _mm_malloc(size, align) function for the allocation and _mm_free( mem_addr) function for the deallocation.

## Linux:

Linux provides the posix_memalign(memptr, alignment, size) function, and the returned address will be a multiple of the alignment.

The alignment must be a power of two and a multiple of sizeof(void *). 