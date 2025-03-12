#include <iostream>
#include <chrono>
#include <limits>
#include <cstdlib>

void test(int* a,const int& M, const int& N,
	  const int& value){
  for(int i=0;i<M;++i){
    for(int j=0;j<N;++j){
      if(a[i*M+j]!= value){std::cerr<<"Error\n"; exit(1);}
    }
  }
}

int main(int argc,char* argv[]) {
  const int M{128},N{128};
  int A[M][N];
  double time_spent{std::numeric_limits<double>::max()};
  int iteration_number{3};
  /*Non-contiguous memory access*/
  for(int k=0;k<iteration_number;k++){
    auto start = std::chrono::high_resolution_clock::now();
    for(int j=0;j<N;++j){
      for(int i=0;i<M;++i){
	A[i][j] = 2;
      }
    }
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> exec_time = end - start;
    time_spent = exec_time.count()<time_spent ? exec_time.count():time_spent;
  }
  test(A[0],M,N,2);
  std::cout << "Execution Time for non-contiguous memory access : "<< time_spent <<" ms\n";
  time_spent = std::numeric_limits<double>::max();
  /*Contiguous memory access*/
  for(int k=0;k<iteration_number;k++){
    auto start = std::chrono::high_resolution_clock::now();
    for(int i=0;i<M;++i){
      for(int j=0;j<N;++j){
        A[i][j] = 4;
      }
    }
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> exec_time = end - start;	
    time_spent = exec_time.count()<time_spent ?	exec_time.count():time_spent;
  }
  test(A[0],M,N,4);
  std::cout << "Execution Time for contiguous memory access : "<< time_spent <<" ms\n";
  return EXIT_SUCCESS;
}
