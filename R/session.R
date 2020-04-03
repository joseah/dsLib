#' @title Prints R session info
#' @author Jose Alquicira-Hernandez
#' @param path Path to write file with the session info
#' @param save Write session info? If \code{FALSE}, session info is only displayed in console
#' @importFrom here here
#' @importFrom git2r revparse_single
#' @importFrom git2r repository
#' @importFrom devtools session_info
#' @export

print_session  <- function(path = NULL, save = TRUE) {
  output <- ""
  repo <- tryCatch(revparse_single(repository(here()),"HEAD"),
                   error = function(e) {
                     NULL
                   })
  if(!is.null(repo)){
    output <- "- Git details:\n"
    output <- paste0(output, "Commit: ", crayon::yellow(repo$sha), "\n")
    output <- paste0(output, "Message: ", crayon::bold(repo$summary), "\n")
    author <- capture.output(print(repo$author))
    output <- paste0(output, paste0(author, collapse = "\n"), "\n")
  }

  output <- paste0(output, paste0(session_info(), collapse = "\n"), "\n\n")

  if(is.null(path)){
    path <- "session.info"
  }else{
    path <- file.path(path, "session.info")
  }

  # Write file
  if(save) cat(output, file = path)

  # Print output
  width <- options()$width
  options(width = 90)
  cat(output)
  options(width = width)

}
