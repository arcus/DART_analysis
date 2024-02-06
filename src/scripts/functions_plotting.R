library(ggplot2)
theme_set(theme_classic())

chop_blue <- "#41b6e6"
chop_blue_light1 <- "#4fbbe8"
chop_blue_light2 <- "#63c3ea"
chop_blue_light3 <- "#76caed"
chop_blue_light4 <- "#8ad2f0"
chop_blue_light5 <- "#9dd9f2"
chop_blue_light6 <- "#b1e1f5"
chop_blue_light7 <- "#c4e8f7"
chop_blue_light8 <- "#d8f0fa"
chop_blue_light9 <- "#ebf7fc"
chop_darkblue <- "#005587"
chop_pink <- "#ed1f7f"
chop_pink_light1 <- "#eb3684"
chop_pink_light2 <- "#ed4c91"
chop_pink_light3 <- "#ef629f"
chop_pink_light4 <- "#f179ad"
chop_pink_light5 <- "#f48fba"
chop_pink_light6 <- "#f6a6c8"
chop_pink_light7 <- "#f8bcd6"
chop_pink_light8 <- "#fad2e4"
chop_pink_light9 <- "#fde9f1"
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
