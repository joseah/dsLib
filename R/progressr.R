#' @title Set up progressr future map iterator
#' @description Seur up progressr iterator

setup_progressr <- function(){

  text <- 'FUN <- function(xs){
  p <- progressor(along = xs)
  y <- future_map(xs, function(x){


    p(sprintf("%g", x))
  })
}'
  rstudioapi::insertText(text = text)

}



