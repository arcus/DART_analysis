# define function for saving de-identified versions of interim data
save_data_deid <- function(data_name){
  
  # save a de-identified version that we can share 
  readRDS(here::here("data", "interim", paste0(data_name, ".rds"))) |> 
    # ensure there's no potentially identifying information (names, emails, open text fields)
    dplyr::select(!tidyselect::where(is.character)) |> 
    saveRDS(file = here::here("data", "interim", paste0(data_name, "_deid.rds"))) 
  
  full <- readRDS(here::here("data", "interim", paste0(data_name, ".rds")))
  deid <- readRDS(here::here("data", "interim", paste0(data_name, "_deid.rds")))
  message("\n", ncol(full) - ncol(deid), 
          paste(" columns dropped in de-identified version of", data_name  ,"data\n"), 
          paste(colnames(full)[!colnames(full) %in% colnames(deid)], collapse = "\n"))
}

# the following functions are used in 03_clean_needs_assessment.R

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