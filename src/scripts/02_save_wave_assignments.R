# save list of participants by wave

readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # don't include any identifying information, so we can post this on GH
  dplyr::select(record_id, wave) |> 
  dplyr::filter(wave %in% c(1,2)) |> 
  readr::write_csv(file = here::here("participant_waves.csv"), na = "")

# save a list of participants by wave and pathway
readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # don't include any identifying information, so we can post this on GH
  dplyr::select(record_id, wave, pathway_wave2) 

# pull data from Pipeline with labels to get pathways
pipeline_formData <- list("token"=Sys.getenv("Pipeline_56668"),
                          content='record',
                          action='export',
                          format='csv',
                          type='flat',
                          csvDelimiter='',
                          rawOrLabel='label',
                          rawOrLabelHeaders='raw',
                          exportCheckboxLabel='false',
                          exportSurveyFields='false',
                          exportDataAccessGroups='false',
                          returnFormat='json'
)

httr::content(httr::POST("https://redcap.chop.edu/api/", body = pipeline_formData, encode = "form"), show_col_types = FALSE) |> 
  dplyr::mutate(pathway = dplyr::coalesce(pathway, pathway_wave2)) |> 
  dplyr::select(record_id, pathway) |> 
  readr::write_csv("participant_pathways.csv")
