#' @title Create output directory
#' @author Jose Alquicira-Hernandez
#' @param name Directory name
#' @param date Date
#' @examples
#' setOutput("data_analysis", "2019-05-30")
#'

setOutput <- function(name, date) {
  if (!requireNamespace("here", quietly = TRUE)) {
    stop("Package \"here\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  if(!is.character(name) & is.character(date)){
    stop("All arguments must be strings")
  }

  output <- file.path("results", paste(date, name, sep = "_"))

  if(!dir.exists(output)){
    dir.create(here(output))
  }

  return(output)

}
