
readRDS(here::here("data", "raw", "DART_Pipeline_metadata.rds")) |> 
  # replace blanks with NA
  dplyr::mutate(dplyr::across(tidyselect::where(is.character), ~ dplyr::na_if(.,""))) |> 
  # get rid of section headers that aren't in matrix groups
  dplyr::mutate(section_header = dplyr::if_else(is.na(matrix_group_name), NA, section_header)) |> 
  # fill in section_header for all items in a matrix group
  dplyr::group_by(matrix_group_name) |> 
  tidyr::fill(section_header) |> 
  # saved cleaned data
  # NOTE: since this is metadata only, it can be saved directly in data/deidentified
  saveRDS(file = here::here("data", "deidentified", "pipeline_metadata.rds")) 
