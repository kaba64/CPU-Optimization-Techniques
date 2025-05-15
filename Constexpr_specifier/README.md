# The Constexpr Function Enhancement Over C++ versions:


The constexpr specifier introduced in C++11 can be applied to variables and functions. The only types usable within a constexpr context are literal types.

A constexpr variable is constant, and its value must be known at compile time. 

A constexpr function can be evaluated at compile time if its arguments are known at compile time; otherwise, it will be evaluated at run time so that we do not have to define another function for the non-constexpr version.

A constexpr function or constructor is implicitly inline. Using constexpr variables and functions can boost performance by possibly reducing run time and placing the data in read-only memory. It can also be used to supply the template argument values and to reduce the chance of data race in multi-threaded programming. However, there are restrictions on the function to be declared constexpr, which have been relaxed in different versions of C++.

## Some restrictions in C++11:

The function must be simple: a single return statement, no void return type, no loops, no local variables, no if-else statement, and no side effects, meaning that it should not modify the global variables.

A constexpr function can be recursive and use conditional expression. An example of an allowed constexpr function at C++11:

```c

constexpr int fac(int n){
    return n == 1 ? 1 : n * fac(n - 1);
}

```

## Some restrictions in C++14:

Some of the restrictions in C++11 on the constexpr function have been lifted. It can have a void return value, define and initialize variables, and use if, switch, for, while and do-while keywords. However, they may not use goto, try-catch or initialize any label, static variable or thread_local variable. Lambda functions also may not be declared constexpr.

An example of an allowed constexpr function at C++14:

```c

template<typename T,std::size_t N>
constexpr T sum_array(const std::array<T, N>& a) {
  T sum = T{0};
  for (std::size_t i = 0; i < a.size(); ++i)
    sum += a[i];
  return sum;
}

```

## Some restrictions in C++17:

A lambda function can be declared constexpr in C++17.

```c

constexpr auto abs_val = []<typename T>(T x){
  return x >= 0 ? x : -x;
};

```

References:

[1] C++ Programming Language, Fourth Edition

[2] https://en.cppreference.com/w/cpp/language/constexpr#constexpr_function
