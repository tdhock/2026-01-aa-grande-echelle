\name{add_interface}
\alias{add_interface}
\title{
  Add interface
}
\description{
  Add two numeric vectors
}
\usage{
add_interface(input1, input2)
}
\arguments{
  \item{input1}{
    A numeric vector to add.}
  \item{input2}{
    Another numeric vector to add (with the same length).}
}
\value{
  A new numeric vector (the sum of the two inputs).
}
\author{
  Toby Dylan Hocking
}
\examples{
Rcpp.add::add_interface(c(NA,1,Inf),3:5)
}
