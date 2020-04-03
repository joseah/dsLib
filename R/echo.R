#' @title Prints formatted message
#' @author Jose Alquicira-Hernandez
#' @param message Message to print
#' @param mem Track memory usage?
#' @importFrom  tictoc tic
#' @importFrom pryr mem_used
#' @importFrom methods is
#' @importFrom utils capture.output
#' @export
#' @examples
#'
#' inicio("Analyzing data")
#'

inicio <- function(message = NULL,  mem = FALSE){

  if(mem){
    mem <- capture.output(print(mem_used()))
    mem <- paste0(cli::symbol$star ,  " Current mem used = ", crayon::green(mem), "\n")
  }else{
    mem <- ""
  }

  cat(cli::symbol$tick,
      crayon::blue(paste0(format(Sys.time(), "(%d/%b/%Y %X): "))),
      crayon::bold(message),
      "\n",
      mem,
      sep = "")
  tic()

}


#' @title Prints "DONE!" message
#' @author Jose Alquicira-Hernandez
#' @param mem Track memory usage?
#' @importFrom tictoc toc
#' @importFrom pryr mem_used
#' @importFrom methods is
#' @importFrom utils capture.output
#' @export
#' @examples
#' fin()
#'

fin <- function(mem = FALSE){

  x <- toc(log = TRUE, quiet = TRUE)

  if(mem){
    mem <- capture.output(print(mem_used()))
    mem <- paste0(cli::symbol$star ,  " Final mem used   = ", crayon::green(mem), "\n")
  }else{
    mem <- ""
  }


  if(!is.null(x)){
    timeDiff <- x$toc - x$tic
    time <- formatTime(timeDiff)
    timeDiff <- round(time$value, digits = 3)
    timeUnit <- time$unit
    string <- paste(cli::symbol$star, " Elapsed time:", crayon::yellow(timeDiff, timeUnit), "\n")
  }


  string <- paste0(mem,
                   string)
  cat(string,
      cli::symbol$tick,
      crayon::blue(paste0(format(Sys.time(), "(%d/%b/%Y %X): "))),
      crayon::bold("DONE!"), sep = "")
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
