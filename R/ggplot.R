#' @title Remove legend from ggplot
#' @author Jose Alquicira-Hernandez
#' @param ... A ggplot object
#' @importFrom ggplot2 theme
#' @export
#'

no_legend <- function(...) {

  theme_no_legend <- theme(
    legend.position = 'none',
    validate = TRUE,
    ...)

  return(theme_no_legend)
}

#' @title Rotate x-axis labels from ggplot
#' @author Jose Alquicira-Hernandez
#' @param ... A ggplot object
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 element_text
#' @export
#'

rotate_x <- function(angle = 90, ...) {

  theme_rotate <- theme(
    axis.text.x = element_text(angle = angle, hjust = 1),
    validate = TRUE,
    ...)

  return(theme_rotate)
}


