#include "add.h"
int add_pointers
(const double *x_ptr, const double *y_ptr, const int size,
 // inputs above, output below.
 double *out_ptr){
  if(size < 1)return ERROR_NO_DATA;
  for (int idx = 0; idx < size; idx++)
    out_ptr[idx] = x_ptr[idx] + y_ptr[idx];
  return SUCCESS;
}
