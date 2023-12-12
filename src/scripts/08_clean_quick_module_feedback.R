readRDS(here::here("data", "raw", "quick_module_feedback.rds")) |> 
  dplyr::mutate(date = lubridate::floor_date(feedback_timestamp, unit = "days")) |> 
  # we added pilot_participant after cohort, so responses with non-missing values for cohort should be backfilled as pilots
  dplyr::mutate(pilot_participant = ifelse(is.na(pilot_participant) & !is.na(cohort), "yes", pilot_participant)) |> 
  tidyr::replace_na(list(research_participant_yn = 0, 
                         pilot_participant = "no")) |> 
  dplyr::mutate(type = dplyr::case_when(research_participant_yn == 1 ~ "Study Participants",
                                        pilot_participant == "yes" ~ "Study Participants", 
                                        research_participant_yn == 0 & pilot_participant == "no" ~ "Other Users")) |> 
  # module_name used to include quotes, now it doesn't. remove all the quotes to make it consistent.
  dplyr::mutate(module_name = gsub(x = module_name, pattern = '"', replacement = ''),
                module_name = tolower(module_name),
                module_name = gsub(x = module_name, pattern = "basics:", replacement = "basics")) |> 
  # cleanup module names that have changed over time
  dplyr::mutate(module_name = dplyr::case_when(
    module_name == "bash / command Line" ~ "bash command line 101",
    module_name == "bash combining commands" ~ "bash: combining commands",
    module_name == "bash loops and conditional statements" ~ "bash: conditionals and Loops",
    module_name == "bash searching and organizing files" ~ "bash: searching and organizing files",
    module_name == "creating a git repository" ~ "creating your git repository",
    module_name == "data visualization in ggplot2" ~ "data visualizations in ggplot2",
    module_name == "data visualization in seaborn" ~ "data visualizations in seaborn",
    module_name == "learning how to learn data science" ~ "learning to learn data science",
    module_name == "r basics transform data" ~ "r basics transforming data with dplyr",
    module_name == "r basics visualize data" ~ "r basics visualizing data with ggplot2",
    module_name == "reproducibility, generalized data structures , and reuse" ~ "reproducibility, generalizability, and reuse",
    module_name == "reproducibility, generalizability, and reuse: how technology can help" ~ "reproducibility, generalizability, and reuse",
    module_name == "setting up git for mac and linux" ~ "setting up git on mac and linux",
    module_name == "sql, intermediate level" ~ "sql intermediate",
    module_name == "sql joins demystified" ~ "sql joins",
    TRUE ~ module_name
  )) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "quick_module_feedback.rds"))
