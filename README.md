# mips-assembly-programs
Collection of MIPS32 assembly programs demonstrating array operations, linear search, floating-point arithmetic, and memory addressing using SPIM.
# MIPS Assembly Programs

A collection of MIPS32 assembly programs written for the MARS/SPIM 
simulator, demonstrating core computer organization concepts including 
memory addressing, array manipulation, floating-point arithmetic, 
and iterative algorithms.

## Programs

### 1. Integer Array Subtraction
Computes C[i] = A[i] - B[i] for two integer arrays of size 10 
and prints the result array.

### 2. Array Maximum Finder
Performs a linear scan of an integer array to find and print 
the largest value.

### 3. Linear Search
Searches an integer array for a target value and prints the 
index if found, or -1 if not found.

### 4. Float Array Subtraction
Computes C[i] = A[i] - B[i] for two floating-point arrays 
using MIPS floating-point registers (FPU).

## Concepts Demonstrated

- Memory addressing and pointer arithmetic
- Integer and floating-point register usage
- Iterative loops using branch instructions
- MIPS syscalls for I/O
- Array traversal with byte offset calculation (sll by 2)

## How to Run

**Requirements:** MARS or SPIM MIPS simulator.

**In MARS:**
1. Open MARS simulator
2. File → Open → select any .s file
3. Run → Assemble (F3)
4. Run → Go (F5)

## File Structure
