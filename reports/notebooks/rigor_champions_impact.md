Rigor Champions Impact
================
Rose Hartman
2023-11-16

``` r
# load custom functions for plotting
source(here::here("src", "scripts", "functions_plotting.R"))

# if the figures directory doesn't exist, create it
dir.create(here::here("reports"), showWarnings = FALSE)
dir.create(here::here("reports", "figures"), showWarnings = FALSE)
```

``` r
quick_module_feedback <- readRDS(here::here("data", "raw", "quick_module_feedback.rds")) |> 
  dplyr::mutate(date = lubridate::floor_date(feedback_timestamp, unit = "days"))
```

``` r
program_dates <- as.Date(c("2023-01-30", "2023-03-27", "2023-05-22", "2023-08-07", "2023-09-30", "2023-11-27"))
names(program_dates) <- c("w1_start", "w1_mid", "w1_end", "w2_start", "w2_mid", "w2_end")

p1 <- quick_module_feedback |> 
  dplyr::count(date) |> 
  dplyr::mutate(total = cumsum(n),
                date = as.Date(date)) |> 
  ggplot(aes(x=date, y=total)) + 
  labs(x=NULL, y = "Number of responses", title = "Cumulative total feedback responses submitted") +
  annotate("rect", fill = chop_blue, alpha = 0.3, 
        xmin = program_dates["w1_start"], 
        xmax = program_dates["w1_end"],
        ymin = -Inf, ymax = Inf)  + 
  annotate("rect", fill = chop_blue, alpha = 0.3, 
        xmin = program_dates["w2_start"], 
        xmax = program_dates["w2_end"],
        ymin = -Inf, ymax = Inf)  + 
  geom_line(color = chop_darkblue) + 
  scale_x_date(date_breaks = "3 months", date_labels = "%b %Y") + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) + 
  annotate("text", x = program_dates[c("w1_mid", "w2_mid")], y = 500, label = c("Wave 1", "Wave 2")) 

ggsave(filename = "feedback_over_time.png", 
       plot = p1,
       path = here::here("reports", "figures"),
       width = 4, height = 4, units = "in")
```

![](../figures/feedback_over_time.png)
