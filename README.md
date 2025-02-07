# Objective-C Memory Management Pitfalls: Delegates and Blocks

This repository demonstrates common, yet easily overlooked, memory management issues in Objective-C related to delegates and blocks.  Improper handling of these can lead to crashes, memory leaks, and unpredictable behavior.

**Problem:**
The `bug.m` file illustrates how a strong reference to a delegate in `MyObject` can create a retain cycle if not handled carefully. Similarly, it shows how capturing `self` strongly within a block can lead to a strong reference cycle that prevents deallocation.

**Solution:**
The `bugSolution.m` file provides corrected implementations that demonstrate the correct usage of `weak` references for delegates to prevent retain cycles. The solution also illustrates how to correctly use `__weak` to prevent retain cycles when capturing `self` in a block.

**How to run:**
This example needs an Xcode project setup for compilation and testing.