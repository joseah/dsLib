#' @title Prints formatted message
#' @author Jose Alquicira-Hernandez
#' @param string Message to print
#' @param start A string symbol
#' @param ellipsis If TRUE, adds ellipsis to message
#' @param mem Track memory usage?
#' @importFrom  tictoc tic
#' @importFrom pryr mem_used
#' @export
#' @examples
#'
#' init("Analyzing data")
#'

init <- function(string = NULL, start = "==>", ellipsis = TRUE, mem = TRUE) {

  if(is.null(string)){
    string <- ""
    ellipsis <- FALSE
  }

  if(ellipsis){
    ellipsis <- "..."
  }else{
    ellipsis <- ""
  }

  final <- paste0(" ", ellipsis ,"\n")
  mem <- capture.output(print(mem_used()))
  mem <- paste0(">> Current mem use = ", mem, "\n")
  final <- paste0(final, mem)

  cat(start, paste0(format(Sys.time(), "(%d/%b/%Y %X): "), string, final), sep = "")
  tic()

}


#' @title Prints "DONE!" message
#' @author Jose Alquicira-Hernandez
#' @importFrom tictoc toc
#' @importFrom pryr mem_used
#' @param start A string symbol
#' @export
#' @examples
#' done()
#'

done <- function(start = "==>"){

  mem <- capture.output(print(mem_used()))
  mem <- paste0(">> Final mem use = ", mem)

  x <- toc(log = TRUE, quiet = TRUE)

  if(!is.null(x)){
    timeDiff <- x$toc - x$tic
    time <- formatTime(timeDiff)
    timeDiff <- round(time$value, digits = 3)
    timeUnit <- time$unit
    string <- paste(">>> Elapsed time:", timeDiff, timeUnit, "\n")
    string <- paste0(string, start, " DONE!\n")
  }else{
    string <- paste0(start, " DONE!\n")
  }


  string <- paste0(mem, "\n", string)
  cat(string)
}

#' @title Formats time for seconds, minutes and hours
#' @author Jose Alquicira-Hernandez
#' @param x Numeric value representing seconds
#' @return A list with the format-numeric value and its time unit
#' @export
#' @examples
#' formatTime(60)
#' formatTime(60 * 60)
#'


formatTime <- function(x){

  if(x >= 3600){
    x <- x/60/60
    unit <- "hrs"
  }else if(x >= 60){
    x <- x/60
    unit <- "mins"
  }else{
    unit <- "secs"
  }

  list(value = x, unit = unit)
}
