

not_sure <- function(col){
  # replaces responses of 6 ("not sure") with NA
  col <- ifelse(col == 6, NA, col)
  return(col)
}

impute_missing_as_1 <- function(col){
  # for items with missing values, replace missing values with 1 (the lowest score)
  col <- ifelse(is.na(col), 1, col)
  return(col)
}

readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed needs assessment survey
  dplyr::filter(needs_assessment_complete == 2) |> 
  # select just fields from needs assessment
  dplyr::select(record_id, data_viz_relevance:longitudinal_learn) |> 
  # 6 = "not sure", make missing on all likert columns
  dplyr::mutate(dplyr::across(tidyselect::matches("_relevance|_expertise|_learn"), not_sure)) |> 
  # replace all missing values with 1 (the lowest possible score)
  dplyr::mutate(dplyr::across(tidyselect::matches("_relevance|_expertise|_learn"), impute_missing_as_1)) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "needs_assessment.rds")) 
