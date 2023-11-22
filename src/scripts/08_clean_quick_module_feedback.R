readRDS(here::here("data", "raw", "quick_module_feedback.rds")) |> 
  dplyr::mutate(date = lubridate::floor_date(feedback_timestamp, unit = "days")) |> 
  tidyr::replace_na(list(research_participant_yn = 0, 
                         pilot_participant = "no")) |> 
  dplyr::mutate(type = dplyr::case_when(research_participant_yn == 1 ~ "Study Participants",
                                        pilot_participant == "yes" ~ "Study Participants", 
                                        research_participant_yn == 0 & pilot_participant == "no" ~ "Other Users")) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "quick_module_feedback.rds"))