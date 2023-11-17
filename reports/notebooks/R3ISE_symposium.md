R3ISE Symposium Materials
================
Rose Hartman
2023-11-09

``` r
# load custom functions for plotting
library(ggplot2)
theme_set(theme_classic())

chop_blue <- "#41b6e6"
chop_darkblue <- "#005587"
chop_pink <- "#ed1f7f"
chop_green <- "#91a01e"
chop_brown <- "#786452"
chop_brown_text <- "#55473c"

# if the figures directory doesn't exist, create it
dir.create(here::here("reports"), showWarnings = FALSE)
dir.create(here::here("reports", "figures"), showWarnings = FALSE)
```

``` r
participants <- readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  dplyr::select(record_id, wave) |> 
  na.omit() |> 
  unique() |> 
  # limit analysis to wave 1, as wave 2 data collection isn't completed yet
  dplyr::filter(wave == 1)

nih_post <- readRDS(here::here("data", "interim", "nih_post.rds")) |> 
  dplyr::filter(record_id %in% participants$record_id) |> 
  dplyr::mutate(event = "post")

nih_pre <- readRDS(here::here("data", "interim", "nih_pre.rds")) |> 
  # only include pretest for which we also have posttest 
  dplyr::filter(record_id %in% nih_post$record_id) |> 
  dplyr::mutate(event = "pre")

nih <- rbind(nih_pre, nih_post) |> 
  dplyr::mutate(event = factor(event, levels = c("pre", "post")))

# load exit survey
exit <- readRDS(here::here("data", "interim", "exit_survey.rds"))

# get pathway assignments
pathways <- readr::read_csv("/Users/hartmanr1/Documents/GitHub/DART_wave1_analysis/pathway_assignments.csv")
```

    ## Rows: 111 Columns: 2
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (1): pathway
    ## dbl (1): record_id
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
nih <- nih |> 
  dplyr::rowwise() |> 
  dplyr::mutate(ability = mean(dplyr::c_across(findable:atomize), na.rm = TRUE),
                openscience = mean(dplyr::c_across(data_storage_1:code_efficient), na.rm = TRUE))
```

``` r
engagement <- exit |> 
  dplyr::rowwise() |> 
  dplyr::mutate(engagement = mean(c(completed_modules, interaction_how_often), na.rm = TRUE)) |> 
  # only keep record_id and the engagement index
  dplyr::select(record_id, engagement, completed_modules, interaction_how_often)
```

``` r
# combine engagement with nih data, drop variables we don't need, get it in wide format for easier comparison
data <- nih |> 
  dplyr::select(record_id, event, ability, openscience) |> 
  tidyr::pivot_longer(cols = c(ability, openscience)) |> 
  tidyr::pivot_wider(id_cols = record_id, names_from = c(name, event), values_from = value) |> 
  dplyr::left_join(engagement, by = "record_id") |> 
  dplyr::left_join(pathways, by = "record_id") |> 
  # calculate change scores
  dplyr::mutate(ability_change = ability_post - ability_pre,
                openscience_change = openscience_post - openscience_pre) |> 
  dplyr::select(record_id, pathway, engagement, completed_modules, interaction_how_often, ends_with("change"), ends_with("pre"), ends_with("post")) |> 
  # only keep cases that have data for all three key variables
  dplyr::filter(!is.na(engagement) & !is.na(ability_change) & !is.na(openscience_change))
```

``` r
plot_data <- data |> 
  tidyr::pivot_longer(cols=tidyselect::starts_with(c("ability","openscience"))) |> 
  tidyr::separate(name, into=c("measure", "event"), sep="_") |> 
  tidyr::pivot_wider(names_from = measure, values_from = value) |> 
  dplyr::mutate(event = factor(event, levels = c("pre", "post", "change")))

plot_data_means <- plot_data |> 
  dplyr::filter(event %in% c("pre", "post")) |> 
  dplyr::group_by(event) |> 
  dplyr::summarise(ability = mean(ability), 
                   openscience = mean(openscience))
```

``` r
ability_plot <- plot_data |> 
  dplyr::filter(event %in% c("pre", "post")) |> 
  ggplot(aes(x=event, y=ability)) + 
  scale_y_continuous(breaks = 1:4, limits = c(1,4),
                     labels = c("(1) I wouldn't know where to start",
                                "(2) I could struggle through,\nbut not confident I could do it",
                                "(3) I could probably do it\nwith some trial and error",
                                "(4) I am confident in my ability to do it")) + 
  labs(x=NULL, y=NULL, 
       title = "Ability")

ability_plot + 
  geom_boxplot(fill = chop_blue)
```

![](R3ISE_symposium_files/figure-gfm/change_ability-1.png)<!-- -->

``` r
ability_plot + 
  geom_line(aes(group = record_id), alpha = .4) +
  geom_line(data = plot_data_means, 
            aes(group = 1),
            size= 3, color = chop_blue)
```

![](R3ISE_symposium_files/figure-gfm/change_ability-2.png)<!-- -->

``` r
# 1, strongly disagree | 2, disagree | 3, somewhat disagree | 4, neither agree nor disagree | 5, somewhat agree | 6, agree | 7, strongly agree
openscience_plot <- plot_data |> 
  dplyr::filter(event %in% c("pre", "post")) |> 
  ggplot(aes(x=event, y=openscience)) + 
  scale_y_continuous(breaks = 1:7, limits = c(1,7),
                     labels = c("(1) Strongly Disagree",
                                "(2) Disagree",
                                "(3) Somewhat Disagree",
                                "(4) Neither Agree\nnor Disagree",
                                "(5) Somewhat Agree",
                                "(6) Agree",
                                "(7) Strongly Agree")) + 
  labs(x=NULL, y= NULL,
       title = "Agreement with tenets of open science")

openscience_plot + 
  geom_boxplot(fill = chop_blue)
```

![](R3ISE_symposium_files/figure-gfm/change_openscience-1.png)<!-- -->

``` r
openscience_plot +
  geom_line(aes(group = record_id), alpha = .4) +
  geom_line(data = plot_data_means, 
            aes(group = 1),
            size= 3, color = chop_blue)
```

![](R3ISE_symposium_files/figure-gfm/change_openscience-2.png)<!-- -->
