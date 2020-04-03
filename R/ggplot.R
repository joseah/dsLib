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
    axis.text.x = element_text(angle = angle, hjust = 0.95, vjust = 0.5),
    validate = TRUE,
    ...)

  return(theme_rotate)
}


#' @title Theme pub
#' @author Jose Alquicira-Hernandez
#' @param ... A ggplot object
#' @importFrom ggplot2 theme element_text element_blank element_line
#' @export
#'

theme_pub <- function(...) {
  theme_pub <- theme(text = element_text(size = 14),
                     panel.background = element_blank(),
                     axis.text.x = element_text(color = "black"),
                     axis.text.y = element_text(color = "black"),
                     axis.line = element_line(size = 0.25),
                     validate = TRUE, ...)
  theme_pub
}
