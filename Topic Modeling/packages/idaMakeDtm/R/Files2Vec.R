#' @title Function for reading text files into R
#'
#' @description This function reads in all files ending in .txt into R.
#' The result is a character vector where each entry is a .txt file.
#' The names of the resulting vector are derived from the names of the files.
#'
#' @param directory a path to directory containing the files you want to read into R.
#' @export
#' @examples
#' my_text_vector <- Files2Vec("//div-stpi/public/___STPI_Tools/DocSummarizer/data/")
#'


Files2Vec <- function(directory){
    
    if( ! grepl("/$", directory) ) directory <- paste(directory, "/", sep="")
    
	file.list <- grep("\\.txt", dir(directory), value=T)
	
	vec <- sapply(file.list, function(x){
		result <- scan(paste(directory, x, sep=""), what="character", sep="\n")
		result <- gsub("\\s", " ", result)
		return(result)
	})
	
	names(vec) <- gsub("[^a-zA-Z0-9]", "_", file.list)
	
	return(vec)
}
