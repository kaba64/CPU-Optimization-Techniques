#include <iostream>
#include <iomanip>
#include <limits>
#include <cmath>
#include <type_traits>

/*This function can cause implicit conversion from double to float*/
inline float square1(const float& x){return x*x;}

/*This function avoids implicit conversion, but it allows modification of the 
  argument and does not communicate that it should remain unmodified.*/
inline float square2(float& x){return x*x;}

/*Concept(C++20) to ensure the operator* works for the type*/
template<typename T> concept Multipliable = requires(T a,T b) {{ a*b } -> std::convertible_to<T>;};

/*Concept(C++20) to restrict the type if needed*/
template<typename T>
concept AllowedType = std::same_as<T, float> || std::same_as<T, double>;

/*A template function using C++20 concepts to ensure safety*/
template<typename T>
requires AllowedType<T> && Multipliable<T>
[[gnu::always_inline]] inline T square3(const T& x){return x*x;}

int main(int argc,char* argv[]){

  float x = std::sqrt(std::numeric_limits<float>::max())/2;
  double y = std::sqrt(std::numeric_limits<double>::max())/2;
  
  std::cout<<std::setprecision(20)<<'\n';
  std::cout<<"square1(x) = "<<square1(x)<<'\n';
  std::cout<<"square1(y) = "<<square1(y)<<'\n';
  
  std::cout<<"square3(y) = "<<square3(y)<<"\n\n";
  return 0;    
}
