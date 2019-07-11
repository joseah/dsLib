#' @title Concatenates strings via operator
#' @author Jose Alquicira-Hernandez
#' @param ... strings to paste using paste0()
#' @export
#' @examples
#'
#' "Hello " %p% "world"
#'
#'

`%p%` <- function(...) paste0(...)

