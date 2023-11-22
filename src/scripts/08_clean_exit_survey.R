exit_survey <- readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed exit survey
  # note that the form called "wave1_exit_survey" was used for both wave 1 and 2
  dplyr::filter(wave1_exit_survey_complete == 2) |> 
  # select just fields from exit survey
  dplyr::select(record_id, met_expectations:additional_feedback)
# saved cleaned data
saveRDS(exit_survey, file = here::here("data", "interim", "exit_survey.rds"))

# how many participants have completed?
counts <- exit_survey |> 
  dplyr::left_join(readr::read_csv("participants.csv", show_col_types = FALSE), by = "record_id") |> 
  dplyr::count(wave)
message(sum(counts$n), " total completed exit surveys, (", counts$n[1], " from Wave 1, and ", counts$n[2], " from Wave 2)")
