# Passing Argument by Reference to Functions:

The argument of the function can be passed by value (uses copy operation), reference, or pointer. Each of them has its merit.

One intuitive option is to pass the argument by value if we intend to modify it inside the function. The 'const' keyword can be added to each argument passed by reference that we do not want to be modified inside the function body. This avoids expensive copy operations when the object is large.

There is no restriction that the initializer of a 'const T&' be an lvalue or of type T, in this case [1] (see the reference):

1- Implicit type conversion applied if needed. A narrowing conversion is allowed, e.g. double -> float. 

2- The resultant value from step one is placed in a temporary object of type T.

3- The temporary value is used as the initializer of the function argument.

This can cause overflow or loss of precision if the input value is too large to fit the argument type, and the compiler will not warn about it. A good solution to this is to use template programming with the concept introduced in C++20 to restrict the types that can be accepted as arguments.

The attached code demonstrates the use of template programming with C++20 concepts to avoid this issue.

Reference:

[1] C++ Programming Language, Fourth Edition