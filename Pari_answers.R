#make a function that takes directory name as an argument.
readfile <- function(dir.name,col.num){
  #define file paths of the files in the directory as file.paths.
  file.paths <- dir(deparse(substitute(dir.name)), full.names = TRUE)
  #Read the files in the directory.
  list.of.files <- lapply(file.paths, read.csv)
  #Define columns. lapply function will errors itself if the column number is less than 50.
  access.col <- lapply(list.of.files,function(x){x[,col.num]})
  if(any((lapply(access.col, length))<50)) 
  {warning("Less than 50 observations in one or more files")}
  else{
    cal.coeff.var <- sapply(access.col,function(x)sd(x)/mean(x))
    return(cal.coeff.var)
  }
}

readfile(dir,1)