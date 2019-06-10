#' @title Prints formatted message
#' @author Jose Alquicira-Hernandez
#' @param string Message to print
#' @param lb `2` if break lines are included at the start and end of the string,
#' `1` final only and `0` for no break lines.
#' @importFrom  tictoc tic
#' @examples
#' echo("Analyzing data)
#'

echo <- function(string, lb = 2, ellipsis = TRUE) {

  if(!lb %in% c(0, 1, 2)){
    stop("`lb` must be 2, 1, or 0")
  }

  if(ellipsis){
    ellipsis <- "..."
  }else{
    ellipsis <- ""
  }


  final <- paste0(" ", ellipsis ,"\n")

  if(lb == 2){
    start <- "\n==> "
  }else if(lb == 1){
    start <- "==> "
  }else{
    start <- ""
    final <- ""
  }

  cat(paste0(start, string, final))
  tic()

}


#' @title Prints "DONE!" message
#' @author Jose Alquicira-Hernandez
#' @importFrom tictoc toc
#' @examples
#' done()

done <- function(){
  string <- paste("DONE!")
  toc()
  echo(string, ellipsis = FALSE, lb = 1)
}
