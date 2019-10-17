#' @title Create output directory
#' @author Jose Alquicira-Hernandez
#' @param date Date
#' @param name Directory name
#' @param sep Character delimiter to separate data from directory name
#' @importFrom here here
#' @export
#' @examples
#' set_output("2019-05-30", "data_analysis")
#'

set_output <- function(date, name, sep = "_") {

  if(!is.character(name) & is.character(date)){
    stop("All arguments must be strings")
  }

  output <- file.path("results", paste(date, name, sep = sep))

  if(!dir.exists(output)){
    dir.create(here(output))
  }

  return(output)

}
