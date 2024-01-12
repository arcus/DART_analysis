source(here::here("src", "scripts", "functions_data_cleaning.R"))

readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # only records for which we have a completed needs assessment survey
  dplyr::filter(needs_assessment_complete == 2) |> 
  # select just fields from needs assessment
  dplyr::select(record_id, data_viz_relevance:longitudinal_learn) |> 
  # 6 = "not sure", make missing on all likert columns (the function not_sure is defined in functions_data_cleaning.R)
  dplyr::mutate(dplyr::across(tidyselect::matches("_relevance|_expertise|_learn"), not_sure)) |> 
  # replace all missing values with 1 (the lowest possible score) (the function impute_missing_as_1 is defined in functions_data_cleaning.R)
  dplyr::mutate(dplyr::across(tidyselect::matches("_relevance|_expertise|_learn"), impute_missing_as_1)) |> 
  # ensure there's no potentially identifying information (names, emails, open text fields)
  dplyr::select(!tidyselect::where(is.character)) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "needs_assessment.rds")) 

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("needs_assessment")
