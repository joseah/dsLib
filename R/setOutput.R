#' @title Create output directory
#' @author Jose Alquicira-Hernandez
#' @param date Date
#' @param name Directory name
#' @importFrom here here
#' @export
#' @examples
#' setOutput("2019-05-30", "data_analysis")
#'

setOutput <- function(date, name, sep = "_") {

  if(!is.character(name) & is.character(date)){
    stop("All arguments must be strings")
  }

  output <- file.path("results", paste(date, name, sep = sep))

  if(!dir.exists(output)){
    dir.create(here(output))
  }

  return(output)

}
