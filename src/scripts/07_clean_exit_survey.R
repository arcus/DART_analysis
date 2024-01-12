source(here::here("src", "scripts", "functions_data_cleaning.R"))

labels_agree <- c("Strongly Disagree", "Disagree", "Neither Agree Nor Disagree", "Agree", "Strongly Agree")
labels_amount <- c("I needed less", "It was a good amount", "I needed more")
labels_freq <- c("Never", "Very little", "Sometimes", "Frequently", "Very frequently")
labels_difficulty <- c("Too simple or easy", "Appropriate for my level" ,"Too complex or difficult")

exit_survey <- readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed exit survey
  # note that the form called "wave1_exit_survey" was used for both wave 1 and 2
  dplyr::filter(wave1_exit_survey_complete == 2) |> 
  # select just fields from exit survey
  dplyr::select(record_id, met_expectations:additional_feedback) |> 
  # make likert items factors
  dplyr::mutate(dplyr::across(met_expectations:would_recommend, ~factor(.x, levels = 1:5, labels = labels_agree)),
                dplyr::across(dart_modules:dart_participants, ~factor(.x, levels = 1:3, labels = labels_amount)),
                dplyr::across(c(issues_a11y, issues_inclusion, interaction_how_often), ~factor(.x, levels = 1:5, labels = labels_freq)),
                dplyr::across(easy_or_difficult, ~factor(.x, levels = 1:3, labels = labels_difficulty)))
# saved cleaned data
saveRDS(exit_survey, file = here::here("data", "interim", "exit_survey.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("exit_survey")
