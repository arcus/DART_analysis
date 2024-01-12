source(here::here("src", "scripts", "functions_data_cleaning.R"))

ability_labels <- c("I wouldn't know where to start", "I could struggle through, but not confident I could do it", "I could probably do it with some trial and error", "I am confident in my ability to do it")
values_labels <- c("strongly disagree", "disagree", "somewhat disagree", "neither agree nor disagree", "somewhat agree", "agree", "strongly agree")

# NIH items, pre test
readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed pretest survey
  dplyr::filter(redcap_event_name == "pre_arm_1",
                nih_data_science_items_complete == 2) |> 
  # select just fields from NIH items 
  dplyr::select(record_id, data_storage_1:atomize) |> 
  # make likert items factors
  dplyr::mutate(dplyr::across(findable:atomize, ~factor(.x, levels = 1:4, labels = ability_labels)),
                dplyr::across(data_storage_1:code_efficient, ~factor(.x, levels = 1:7, labels = values_labels))) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "nih_pre.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("nih_pre")

# OSS code sharing items, pre test
readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed pretest survey
  dplyr::filter(redcap_event_name == "pre_arm_1",
                oss_module_code_sharing_fundamentals_complete == 2) |> 
  # select just fields from OSS code sharing 
  dplyr::select(record_id, code_sharing_attitude_1:code_behavior_norm_1) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "oss_code_pre.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("oss_code_pre")


# OSS data sharing items, pre test
readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed pretest survey
  dplyr::filter(redcap_event_name == "pre_arm_1",
                oss_module_data_sharing_fundamentals_complete == 2) |> 
  # select just fields from OSS data sharing
  dplyr::select(record_id, data_sharing_attitude_1:data_behavior_norm_1) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "oss_data_pre.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("oss_data_pre")
