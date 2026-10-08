# ggplot2 theme and palettes matching the CCFE Lab website (custom.scss).
# Use in any .qmd chunk:
#   source("R/theme_ccfe.R")
#   ggplot(df, aes(x, y, colour = group)) + geom_line() +
#     scale_colour_ccfe() + theme_ccfe()

library(ggplot2)

ccfe_cols <- c(
  forest = "#1b4d3e",
  bark   = "#9a5b2e",
  sky    = "#3d7ea6",
  moss   = "#7a9a3a",
  ochre  = "#c58b1b",
  slate  = "#5d6964"
)

ccfe_ink   <- "#1e2723"
ccfe_muted <- "#5d6964"
ccfe_rule  <- "#e3e0d6"
ccfe_paper <- "#fbfaf6"

# Base font: IBM Plex Sans if installed, otherwise the system sans.
theme_ccfe <- function(base_size = 12, base_family = "IBM Plex Sans") {
  if (!base_family %in% systemfonts::system_fonts()$family) base_family <- "sans"

  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      plot.background   = element_rect(fill = ccfe_paper, colour = NA),
      panel.background  = element_rect(fill = ccfe_paper, colour = NA),
      panel.grid.major  = element_line(colour = ccfe_rule, linewidth = 0.4),
      panel.grid.minor  = element_blank(),
      axis.text         = element_text(colour = ccfe_muted),
      axis.title        = element_text(colour = ccfe_ink),
      axis.ticks        = element_blank(),
      plot.title        = element_text(colour = "#12352b", face = "bold",
                                       size = rel(1.25), margin = margin(b = 4)),
      plot.subtitle     = element_text(colour = ccfe_muted, margin = margin(b = 10)),
      plot.caption      = element_text(colour = ccfe_muted, size = rel(0.8), hjust = 0),
      plot.title.position = "plot",
      plot.caption.position = "plot",
      legend.position   = "top",
      legend.justification = "left",
      legend.title      = element_text(colour = ccfe_muted, size = rel(0.85)),
      strip.text        = element_text(colour = ccfe_ink, face = "bold", hjust = 0),
      plot.margin       = margin(12, 14, 10, 10)
    )
}

scale_colour_ccfe <- function(...) scale_colour_manual(values = unname(ccfe_cols), ...)
scale_fill_ccfe   <- function(...) scale_fill_manual(values = unname(ccfe_cols), ...)

# Continuous: pale to forest green (e.g. growth, biomass); diverging for anomalies.
scale_fill_ccfe_c   <- function(...) scale_fill_gradient(low = "#e8f0ec", high = "#12352b", ...)
scale_colour_ccfe_div <- function(...) {
  scale_colour_gradient2(low = "#3d7ea6", mid = "#ece9df", high = "#9a5b2e", midpoint = 0, ...)
}
