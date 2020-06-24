#' @title Not in operator
#' @description nin operator allows using the negation of the in operator
#' @author Jose Alquicira-Hernandez
#' @param x	Vector or NULL: the values to be matched. Long vectors are supported.
#' @param table	Vector or NULL: the values to be matched against. Long vectors are not supported.
#' @export
#' @examples
#'
#' 1:10 %nin% 1:5
#'
#'

`%nin%` <- function(x, table){
  match(x, table, nomatch = 0L) == 0L
}
