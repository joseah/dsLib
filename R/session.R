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
