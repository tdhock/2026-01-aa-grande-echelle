library(data.table)
dir.create("tp5-data")
pre <- "https://rcdata.nau.edu/genomic-ml/cv-same-other-paper/data_Classif/"
data_list <- list()
set.seed(1)
for(data_name in c("vowel","waveform")){
  data.csv <- paste0(data_name, ".csv")
  if(!file.exists(data.csv)){
    u <- paste0(pre, data.csv)
    download.file(u, data.csv)
  }
  orig <- fread(data.csv)
  print(orig[, table(y, predefined.set)])
  small <- orig[
  , subset := ifelse(predefined.set=="test", "A", "B")
  ][, .SD[sample(300)], by=predefined.set]
  print(small[, table(y, predefined.set)])
  out <- small[
    order(subset,y),
    c("subset","y",grep("x",names(small),value=TRUE)),
    with=FALSE
  ]
  fwrite(out, file.path("tp5-data",data.csv))
}
