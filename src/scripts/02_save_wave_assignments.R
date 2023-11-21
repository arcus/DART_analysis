# save list of participants by wave

readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # don't include any identifying information, so we can post this on GH
  dplyr::select(record_id, wave) |> 
  dplyr::filter(wave %in% c(1,2)) |> 
  readr::write_csv(file = here::here("participants.csv"), na = "")
