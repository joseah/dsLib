#' @title Concatenates strings via operator
#' @author Jose Alquicira-Hernandez
#' @param ... strings to paste using paste0()
#' @export
#' @usage
#' "Hello " %p% "world"

`%p%` <- function(...) paste0(...)

