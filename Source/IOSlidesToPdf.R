#How do I convert RMarkdown ioslides presentations to 2-up PDFs programmatically?
#https://stackoverflow.com/questions/51491454/how-do-i-convert-rmarkdown-ioslides-presentations-to-2-up-pdfs-programmatically

.tmp.f <- function(){
  # Setup
  install.packages("webshot")
  webshot::install_phantomjs()
}

library(webshot)

fCreatePdfFromIOSlides <- function(
  filename
  , outFileName = paste0(tools::file_path_sans_ext(filename),".pdf")
  , vwidth = 900 # wide format
  , isVerbose = TRUE
){
  if (isTRUE(isVerbose)) message(outFileName)
  webshot(filename, outFileName, vwidth = vwidth)
}

fCreatePdfFromIOSlidesDir <- function(
  dirName
  , ...    ##<< further arguments to fCreatePdfFromIOSlides
){
  filenames = list.files(dirName,"*.html")
  filepathes = file.path(dirName,filenames)
  ans <- lapply(filepathes, fCreatePdfFromIOSlides, ...)
  filepathes
}

.tmp.f <- function(){
  filename = "StandardProcessing_uStar.html"  
  dirName = "../StandardProcessing"
  fCreatePdfFromIOSlidesDir(dirName)
}

fCreatePdfFromIOSlidesDir("StandardProcessing")



