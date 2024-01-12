source(here::here("src", "scripts", "functions_data_cleaning.R"))

ability_labels <- c("I wouldn't know where to start", "I could struggle through, but not confident I could do it", "I could probably do it with some trial and error", "I am confident in my ability to do it")
values_labels <- c("strongly disagree", "disagree", "somewhat disagree", "neither agree nor disagree", "somewhat agree", "agree", "strongly agree")


# NIH items, post test
nih_post <- readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed posttest survey
  dplyr::filter(redcap_event_name == "post_arm_1",
                nih_data_science_items_complete == 2) |> 
  # select just fields from NIH items 
  dplyr::select(record_id, data_storage_1:atomize) |> 
  # make likert items factors
  dplyr::mutate(dplyr::across(findable:atomize, ~factor(.x, levels = 1:4, labels = ability_labels)),
                dplyr::across(data_storage_1:code_efficient, ~factor(.x, levels = 1:7, labels = values_labels))) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "nih_post.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("nih_post")

# OSS code sharing items, post test
readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed posttest survey
  dplyr::filter(redcap_event_name == "post_arm_1",
                oss_module_code_sharing_fundamentals_complete == 2) |> 
  # select just fields from OSS code sharing 
  dplyr::select(record_id, code_sharing_attitude_1:code_behavior_norm_1) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "oss_code_post.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("oss_code_post")

# OSS data sharing items, post test
readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed posttest survey
  dplyr::filter(redcap_event_name == "post_arm_1",
                oss_module_data_sharing_fundamentals_complete == 2) |> 
  # select just fields from OSS data sharing
  dplyr::select(record_id, data_sharing_attitude_1:data_behavior_norm_1) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "oss_data_post.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("oss_data_post")

# how many participants have completed?
counts <- readRDS(here::here("data", "interim", "nih_post.rds")) |> 
  dplyr::left_join(readr::read_csv(here::here("participant_waves.csv"), show_col_types = FALSE), by = "record_id") |> 
  dplyr::count(wave)
message(sum(counts$n), " total completed NIH post surveys, (", counts$n[1], " from Wave 1, and ", counts$n[2], " from Wave 2)")
