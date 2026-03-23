This branch has an issue installing a package in a sub-directory
```r
> remotes::install_github("tdhock/2026-01-aa-grande-echelle/demos/Rcpp-add-pkg@réf-issue")
Using GitHub PAT from the git credential store.
Downloading GitHub repo tdhock/2026-01-aa-grande-echelle@HEAD
Error: Failed to install 'Rcpp.add' from GitHub:
  input string 61 is invalid
In addition: Warning message:
In gsub("[^/]", "", file_list) :
  unable to translate 'tdhock-2026-01-aa-grande-echelle-45ca0f3/r+<ac>f+<ac>rences.org' to a wide string
```
