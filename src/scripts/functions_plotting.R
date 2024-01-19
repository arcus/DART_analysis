library(ggplot2)
theme_set(theme_classic())

chop_blue <- "#41b6e6"
chop_darkblue <- "#005587"
chop_pink <- "#ed1f7f"
chop_green <- "#91a01e"
chop_brown <- "#786452"
chop_brown_text <- "#55473c"

save_and_print <- function(plot, filename, width = NA, height = NA){
  ggplot2::ggsave(filename = filename, 
         plot = plot, 
         path = here::here("reports", "figures"),
         width = width, 
         height = height, 
         units = "in")
  
  knitr::include_graphics(here::here("reports", "figures", filename))
}
