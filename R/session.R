#' @title Prints R session info
#' @author Jose Alquicira-Hernandez
#' @importFrom here here
#' @importFrom git2r revparse_single
#' @importFrom git2r repository
#' @importFrom devtools session_info
#' @export

printSession  <- function() {
  repo <- tryCatch(revparse_single(repository(here()),"HEAD"),
                   error = function(e) {
                     NULL
                   })
  if(!is.null(repo)){
    cat("- Git details:", sep = "\n")
    cat("Commit:", repo$sha, "\n")
    cat("Message:", repo$summary, "\n")
    print(repo$author)
    cat("\n")
  }
  options(width = 90)
  session_info()
}


printSession  <- function(path = NULL) {
  output <- ""
  repo <- tryCatch(revparse_single(repository(here()),"HEAD"),
                   error = function(e) {
                     NULL
                   })
  if(!is.null(repo)){
    output <- "- Git details:\n"
    output <- paste0(output, "Commit: ", repo$sha, "\n")
    output <- paste0(output, "Message: ", repo$summary, "\n")
    author <- capture.output(print(repo$author))
    output <- paste0(output, paste0(author, collapse = "\n"), "\n")
  }

  output <- paste0(output, paste0(session_info(), collapse = "\n"))

  if(is.null(path)){
    path <- "session.info"
  }else{
    path <- here(path, "session.info")
  }

  # Write file
  cat(output, file = path)

  # Print output
  width <- options()$width
  options(width = 90)
  cat(output)
  options()$width <- width

}
