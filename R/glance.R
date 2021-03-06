#' @title Show a subset from data
#' @author Jose Alquicira-Hernandez
#' @param x data.frame, matrix, vector, or list object
#' @param n index limit
#' @return A subset from provided object. If `n` exceeds dimensions of `x`, returns
#' maximun dimension
#' @export
#' @examples
#' glance(cars)
#'



glance <- function(x, n = 5) {

  if(is.data.frame(x) | is.matrix(x) | is(x, "Matrix")){

    nRow <- if(nrow(x) < n) nrow(x) else n
    nCol <- if(ncol(x) < n) ncol(x) else n

    i <- seq_len(nRow)
    j <- seq_len(nCol)

    return(x[i,j])

  }else if(is.vector(x) | is.list(x)){

    n <- if(length(x) < n) length(x) else n
    i <- seq_len(n)

    return(x[i])

  }else{
    stop("Object must be a data.frame, matrix, vector, or list")
  }

}
