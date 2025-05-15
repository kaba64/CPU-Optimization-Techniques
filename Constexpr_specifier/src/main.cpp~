#include <iostream>
#include <array>

/*It neds C++11 to compile*/
constexpr int fac(int n){return (n>1)?n*fac(n-1):1;}

/*It neds C++14 to compile*/
template<typename T,std::size_t N>
constexpr T sum_array(const std::array<T, N>& a) {
  T sum{T{0}};
  for (std::size_t i = 0; i < a.size(); ++i)
    sum += a[i];
  return sum;
}

/*It neds C++17 to compile*/
constexpr auto abs_val = []<typename T>(T x){
  return x >= 0 ? x : -x;
};

int main(int argc,char* argv[]){
  
  static_assert(fac(8)==40320,"fac(8) is not equal to 40320");

  constexpr std::array<int,6> data{1,2,3,4,5,6};
  static_assert(sum_array(data)==21,"sum_array(data) is not equal to 21");

  static_assert(abs_val(-2.5)==2.5,"abs_val(-2.5) is not equal to 2.5");

  std::cout<<"\nEnd of main funcion\n\n";
  
  return 0;   
}
