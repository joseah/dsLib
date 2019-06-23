#' @title Prints R session info
#' @author Jose Alquicira-Hernandez
#' @export
#' @importFrom devtools session_info

printSession  <- function() {
  options(width = 90)
  session_info()
}
