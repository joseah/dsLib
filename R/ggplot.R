#' @title Remove legend from ggplot
#' @author Jose Alquicira-Hernandez
#' @param ... Additional arguments for theme
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
#' @param angle rotation angle of x-axis labels
#' @param ... Additional arguments for theme
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
#' @param base_size Text size
#' @param base_family Text family
#' @param border_color Border border color
#' @param border_size  Border size color
#' @param ... Additional arguments for theme
#' @importFrom ggplot2 theme element_text element_blank element_line element_rect
#' @export
#'

theme_pub <- function(base_size = 14, base_family = "",
                      border_color = "grey20", border_size = 0.6, ...) {
  theme_pub <- theme(text = element_text(size = base_size, family = base_family),
                     panel.background = element_blank(),
                     axis.text.x = element_text(color = "black"),
                     axis.text.y = element_text(color = "black"),
                     axis.line = element_blank(),
                     strip.background = element_rect(color = "black", fill = "white"),
                     panel.border = element_rect(fill = NA, colour = border_color, size = border_size),
                     legend.key = element_rect(fill = "white", colour = NA),
                     validate = TRUE, ...)
  theme_pub
}

#' @title Theme lattice
#' @author Jose Alquicira-Hernandez
#' @param base_size Text size
#' @param base_family Text family
#' @param border_color Border border color
#' @param border_size  Border size color
#' @param ... Additional arguments for theme
#' @importFrom ggplot2 theme element_text element_blank element_line element_rect
#' @export
#'

theme_lattice <- function(base_size = 14, base_family = "",
                          border_color = "grey20", border_size = 0.6, ...) {
  theme_lattice <- theme(text = element_text(size = base_size, family = base_family),
                     panel.background = element_blank(),
                     axis.text.x = element_text(color = "black"),
                     axis.text.y = element_text(color = "black"),
                     axis.line = element_blank(),
                     strip.background = element_rect(color = "black", fill =  "#ffe5cc"),
                     panel.border = element_rect(fill = NA, colour = border_color, size = border_size),
                     legend.key = element_rect(fill = "white", colour = NA),
                     validate = TRUE, ...)
  theme_lattice
}







