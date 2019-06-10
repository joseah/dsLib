#' @title Prints formatted message
#' @author Jose Alquicira-Hernandez
#' @param string Message to print
#' @param lb If `TRUE`, a break line is included at the start of the string
#' @importFrom  tictoc tic
#' @export
#' @examples
#'
#' init("Analyzing data")
#'

init <- function(string, lb = TRUE, ellipsis = TRUE, tic = TRUE) {

  if(!lb %in% c(0, 1, 2)){
    stop("`lb` must be 2, 1, or 0")
  }

  if(ellipsis){
    ellipsis <- "..."
  }else{
    ellipsis <- ""
  }


  final <- paste0(" ", ellipsis ,"\n")

  if(lb){
    start <- "\n"
  }else{
    start <- ""
  }

  cat(start, "==>", paste0(format(Sys.time(), "(%d/%b/%Y %X): "), string, final), sep = "")
  if(tic) tic()

}


#' @title Prints "DONE!" message
#' @author Jose Alquicira-Hernandez
#' @param toc If TRUE and `tic()` was used before, displays elapsed time
#' @importFrom tictoc toc
#' @export
#' @examples
#' done()
#'

done <- function(toc = TRUE){
  if(toc){
    x <- toc(log = TRUE, quiet = TRUE)

    timeDiff <- x$toc - x$tic

    if(timeDiff > 60){
      timeDiff <- timeDiff/60
      timeUnit <- "mins"
    }else{
      timeUnit <- "secs"
    }
    timeDiff <- round(timeDiff, digits = 3)
    string <- paste("DONE!", "\n>>> Elapsed time:", timeDiff, timeUnit)
  }else{
    string <- "DONE!"
  }
  init(string, ellipsis = FALSE, lb = FALSE, tic = FALSE)
}
