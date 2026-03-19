#include <Rcpp.h>
#include "add.h"
// [[Rcpp::export]]
Rcpp::NumericVector add_interface(Rcpp::NumericVector input1, Rcpp::NumericVector input2) {
  int n_data = input1.size();
  if(n_data != input2.size())
    Rcpp::stop("input1 length=%d must match input2 length=%d", n_data, input2.size());
  Rcpp::NumericVector result(n_data);
  int status = add_pointers(input1.begin(), input2.begin(), n_data, result.begin());
  if(status==ERROR_NO_DATA)
    throw std::runtime_error("No data");
  return result;
}
