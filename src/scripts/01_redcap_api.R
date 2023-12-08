# API tokens stored in .Renviron https://cran.r-project.org/web/packages/httr/vignettes/secrets.html#environment-variables

# pull data from Pipeline
pipeline_formData <- list("token"=Sys.getenv("Pipeline_56668"),
                 content='record',
                 action='export',
                 format='csv',
                 type='flat',
                 csvDelimiter='',
                 rawOrLabel='raw',
                 rawOrLabelHeaders='raw',
                 exportCheckboxLabel='false',
                 exportSurveyFields='true',
                 exportDataAccessGroups='false',
                 returnFormat='json'
)
pipeline_response <- httr::POST("https://redcap.chop.edu/api/", body = pipeline_formData, encode = "form")
pipeline_result <- httr::content(pipeline_response, show_col_types = FALSE)

if(is.null(nrow(pipeline_result))) {
  message("\nTHE DATA FROM PIPELINE DID NOT DOWNLOAD\n")
  print(pipeline_result$error)
} else {
  # save raw data
  saveRDS(pipeline_result, file = here::here("data", "raw", "DART_Pipeline.rds"))
}

# pull data from NALMS
nalms_formData <- list("token"=Sys.getenv("NALMS_Wave2_61127"),
                 content='record',
                 action='export',
                 format='csv',
                 type='flat',
                 csvDelimiter='',
                 rawOrLabel='raw',
                 rawOrLabelHeaders='raw',
                 exportCheckboxLabel='false',
                 exportSurveyFields='true',
                 exportDataAccessGroups='false',
                 returnFormat='json'
)
nalms_response <- httr::POST("https://redcap.chop.edu/api/", body = nalms_formData, encode = "form")
nalms_result <- httr::content(nalms_response, show_col_types = FALSE)

if(is.null(nrow(nalms_result))) {
  message("\nTHE DATA FROM NALMS DID NOT DOWNLOAD\n")
  print(nalms_result$error)
} else {
  # save raw data
  saveRDS(nalms_result, file = here::here("data", "raw", "NALMS.rds"))
}

# Pull data from Quick Module Feedback
feedback_formData <- list("token"=Sys.getenv("Quick_Module_Feedback_45280"),
                 content='record',
                 action='export',
                 format='csv',
                 type='flat',
                 csvDelimiter='',
                 rawOrLabel='raw',
                 rawOrLabelHeaders='raw',
                 exportCheckboxLabel='false',
                 exportSurveyFields='true',
                 exportDataAccessGroups='false',
                 returnFormat='json'
)
feedback_response <- httr::POST("https://redcap.chop.edu/api/", body = feedback_formData, encode = "form")
feedback_result <- httr::content(feedback_response, show_col_types = FALSE)

if(is.null(nrow(feedback_result))) {
  message("\nTHE DATA FROM Quick Module Feedback DID NOT DOWNLOAD\n")
  print(feedback_result$error)
} else {
  # save raw data
  saveRDS(feedback_result, file = here::here("data", "raw", "quick_module_feedback.rds"))
}
