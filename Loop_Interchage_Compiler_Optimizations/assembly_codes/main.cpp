#include <iostream>

int main(void) {
  const int M{128},N{128};
  int A[M][N];
  
  for(int j=0;j<N;++j){
    for(int i=0;i<M;++i){
      A[i][j] = 2;
    }
  }
  std::cout<<A[5][5]<<"\n";
  for(int i=0;i<M;++i){
    for(int j=0;j<N;++j){
      A[i][j] = 4;
    }
  }
  std::cout<<A[8][8]<<"\n";
  return 0;
}
