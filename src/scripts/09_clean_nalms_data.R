source(here::here("src", "scripts", "functions_data_cleaning.R"))

# save Basic Info
readRDS(here::here("data", "raw", "NALMS.rds")) |> 
  # basic info is the only non-repeating form
  dplyr::filter(is.na(redcap_repeat_instance)) |> 
  dplyr::select(record_id, first_name:basic_info_complete) |> 
  # save cleaned data
  saveRDS(file = here::here("data", "interim", "nalms_basic_info.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("nalms_basic_info")

# Get information about each pathway

# get the number of participants assigned to each pathway
pathway_info <- readr::read_csv(here::here("participant_pathways.csv"), show_col_types = FALSE) |> 
  dplyr::left_join(readr::read_csv(here::here("participant_waves.csv"), show_col_types = FALSE), by = "record_id") |> 
  # only keep Wave 2 participants (there was no NALMS for wave 1)
  dplyr::filter(wave == 2) |> 
  dplyr::count(pathway, name = "pathway_n_part") |> 
  dplyr::filter(!is.na(pathway))

# get the number of modules in each pathway
module_info <- readRDS(here::here("data", "raw", "NALMS.rds")) |> 
  # get just the fields from the pathway forms
  dplyr::select(tidyselect::matches(pathway_info$pathway)) |> 
  # drop the timestamp and completion fields
  dplyr::select(-tidyselect::ends_with("_complete"),
                -tidyselect::ends_with("_timestamp")) |> 
  # we don't need all the actual data in here, just keep the first row
  dplyr::slice_head(n = 1) |> 
  # now all the fields are modules. Pivot to long.
  tidyr::pivot_longer(cols = everything()) |> 
  # extract the pathway name from the module name
  tidyr::separate(name, into = c("pathway", "module"), sep = "_", extra = "merge") |> 
  # count number of modules per pathway
  dplyr::count(pathway, name = "pathway_n_modules")

# save participants per pathway and modules per pathway as pathway_info
dplyr::left_join(pathway_info, module_info, by = "pathway") |> 
  saveRDS(file = here::here("data", "interim", "nalms_pathway_info.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("nalms_pathway_info")

# clean the NALMS activity data itself

readRDS(here::here("data", "raw", "NALMS.rds")) |> 
  # only rows from pathway responses
  dplyr::filter(!is.na(redcap_repeat_instance)) |> 
  # only keep info from pathway forms
  dplyr::select(record_id, redcap_repeat_instrument, redcap_repeat_instance, tidyselect::matches(pathway_info$pathway)) |> 
  # extract pathway from the redcap_repeat_instrument field
  dplyr::mutate(redcap_repeat_instrument = gsub(x=redcap_repeat_instrument, pattern = "(.*)_pathway", replacement = "\\1")) |> 
  dplyr::rename(pathway = redcap_repeat_instrument) |> 
  # save cleaned data
  saveRDS(file = here::here("data", "interim", "nalms_full.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("nalms_full")

# also save a summary file
readRDS(here::here("data", "interim", "nalms_full.rds")) |> 
  # drop each "_complete" field marking if the form is complete for that instance
  dplyr::select(-tidyselect::ends_with("_pathway_complete")) |> 
  # add a column recording if their pathway is complete 
  dplyr::mutate(pathway_finished = rowSums(dplyr::across(tidyselect::ends_with("_complete")), na.rm = TRUE),
                pathway_finished = ifelse(pathway_finished == 2, TRUE, FALSE)) |> 
  # drop the _complete columns (no longer needed)
  dplyr::select(-tidyselect::ends_with("_complete")) |>
  # add a column getting the instance timestamp, across all the pathway forms
  tidyr::pivot_longer(cols = tidyselect::ends_with("_timestamp"), values_to = "timestamp") |> 
  # put in a timestamp for instance 1 (the one we entered before the start of program)
  dplyr::mutate(timestamp = dplyr::case_when(redcap_repeat_instance == 1 ~ lubridate::ymd_hms("2023-08-07 00:00:00", tz="EST"),
                                             TRUE ~ timestamp)) |> 
  dplyr::group_by(record_id, redcap_repeat_instance) |> 
  dplyr::slice_max(timestamp) |> 
  # drop the extra name column from pivot_longer
  dplyr::select(-name) |> 
  # add a column counting how many modules they've marked as complete
  # note that all columns in the data at this point are modules except record_id, pathway, pathway_finished, redcap_repeat_instance, and timestamp
  tidyr::pivot_longer(cols = -c(record_id, pathway, redcap_repeat_instance, timestamp, pathway_finished)) |> 
  # value is 0 (not started), 1 (started), 2 (done). Recode to just done (1) vs not (0)
  dplyr::mutate(value = dplyr::case_when(value == 2 ~ 1, 
                                         TRUE ~ 0)) |> 
  dplyr::group_by(record_id, pathway, redcap_repeat_instance, timestamp, pathway_finished) |> 
  dplyr::summarise(n_modules_done = sum(value, na.rm = TRUE), .groups = "drop") |> 
  # compute number of modules completed since last progress logged
  dplyr::group_by(record_id) |> 
  dplyr::mutate(modules_diff = n_modules_done - dplyr::lag(n_modules_done)) |> 
  dplyr::ungroup() |> 
  # save cleaned data
  saveRDS(file = here::here("data", "interim", "nalms_summary.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("nalms_summary")
