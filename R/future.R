#' @title Define future globals
#' @description Set maxSize for future parallel processing

set_future_globals <- function(){

  rstudioapi::insertText(text = "options(future.globals.maxSize = Inf * 1024^3)")

}
