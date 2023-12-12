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

# how many participants have completed?
counts <- exit_survey |> 
  dplyr::left_join(readr::read_csv(here::here("participant_waves.csv"), show_col_types = FALSE), by = "record_id") |> 
  dplyr::count(wave)
message(sum(counts$n), " total completed exit surveys, (", counts$n[1], " from Wave 1, and ", counts$n[2], " from Wave 2)")

# who has started post test but not completed the exit survey?
incomplete_post <- readRDS(here::here("data", "interim", "nih_post.rds")) |> 
  dplyr::select(record_id) |> 
  # get wave assignments
  dplyr::left_join(readr::read_csv(here::here("participant_waves.csv"), show_col_types = FALSE), by = "record_id") |> 
  # get information on exit survey completion
  dplyr::mutate(exit_complete = ifelse(record_id %in% exit_survey$record_id, 1, 0)) |> 
  dplyr::filter(exit_complete == 0 & wave == 2)

message("The following Wave 2 record IDs started posttest but have not finished:\n", paste(incomplete_post$record_id, collapse = ", "))

count_data <- readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  dplyr::mutate(date = lubridate::date(wave1_exit_survey_timestamp)) |> 
  dplyr::count(date) |> 
  dplyr::filter(date > lubridate::ymd("2023-11-19")) |> 
  dplyr::bind_rows(data.frame(date = lubridate::ymd("2023-11-19"), n=0)) |> 
  dplyr::arrange(date) |> 
  dplyr::mutate(total = cumsum(n)) 

ggplot(count_data, aes(y=total, x=date)) + 
  geom_line() + 
  annotate("text", 
           x = max(count_data$date), 
           y = max(count_data$total) + 10, 
           label = max(count_data$total)) + 
  scale_x_date(date_breaks = "3 days", 
               date_minor_breaks = "1 days",
               date_labels = "%b %d") +
  labs(x = NULL, y = NULL, title = "Wave 2 exit survey completers") + 
  theme_bw() 
