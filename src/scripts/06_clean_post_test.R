
# NIH items, post test
nih_post <- readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed posttest survey
  dplyr::filter(redcap_event_name == "post_arm_1",
                nih_data_science_items_complete == 2) |> 
  # select just fields from NIH items 
  dplyr::select(record_id, data_storage_1:atomize) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "nih_post.rds"))

# OSS code sharing items, post test
readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed posttest survey
  dplyr::filter(redcap_event_name == "post_arm_1",
                oss_module_code_sharing_fundamentals_complete == 2) |> 
  # select just fields from OSS code sharing 
  dplyr::select(record_id, code_sharing_attitude_1:code_behavior_norm_1) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "oss_code_post.rds"))


# OSS data sharing items, post test
readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed posttest survey
  dplyr::filter(redcap_event_name == "post_arm_1",
                oss_module_data_sharing_fundamentals_complete == 2) |> 
  # select just fields from OSS data sharing
  dplyr::select(record_id, data_sharing_attitude_1:data_behavior_norm_1) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "oss_data_post.rds"))
