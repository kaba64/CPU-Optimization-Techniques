#include <iostream>
#include <cstdlib>
#include <memory>

struct DeleterCustom {
  template<typename T>
  void operator()(T* ptr){if (ptr != nullptr) std::free(ptr);}
};

template<typename T>
std::unique_ptr<T[], DeleterCustom> make_aligned_unique_array(const std::size_t N) {

  constexpr std::size_t alignment = std::hardware_constructive_interference_size;
  std::size_t size = N*sizeof(T);
  if(size%alignment){
    size += alignment-(size % alignment);
    std::cout<<"The requested array size is "<<N<<"\n";
    std::cout << "The allocated array size due to alignment constraint is "
          << size / sizeof(T) << "\n";
  }
  
  T* p = static_cast<T*>(std::aligned_alloc(alignment,size));
  if (!p) throw std::bad_alloc();
  
  return std::unique_ptr<T[], DeleterCustom>{p};
}

int main(int argc,char* argv[]) {
  
  constexpr int N = 1024;
  auto aligned_p = make_aligned_unique_array<double>(N);
  aligned_p[0] = 1.23;
  std::cout << aligned_p[0] << "\n";
  
  return 0;
}           
