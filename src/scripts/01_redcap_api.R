# API tokens stored in .Renviron https://cran.r-project.org/web/packages/httr/vignettes/secrets.html#environment-variables

# pull data from Pipeline
formData <- list("token"=Sys.getenv("Pipeline_56668"),
                 content='record',
                 action='export',
                 format='csv',
                 type='flat',
                 csvDelimiter='',
                 rawOrLabel='raw',
                 rawOrLabelHeaders='raw',
                 exportCheckboxLabel='false',
                 exportSurveyFields='false',
                 exportDataAccessGroups='false',
                 returnFormat='json'
)
response <- httr::POST("https://redcap.chop.edu/api/", body = formData, encode = "form")
result <- httr::content(response, show_col_types = FALSE)

if(is.null(nrow(result))) {
  message("\nTHE DATA FROM PIPELINE DID NOT DOWNLOAD\n")
  print(result$error)
} else {
  # save raw data
  saveRDS(result, file = here::here("data", "raw", "DART_Pipeline.rds"))
}

# pull data from NALMS
formData <- list("token"=Sys.getenv("NALMS_Wave2_61127"),
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
response <- httr::POST("https://redcap.chop.edu/api/", body = formData, encode = "form")
result <- httr::content(response, show_col_types = FALSE)

if(is.null(nrow(result))) {
  message("\nTHE DATA FROM NALMS DID NOT DOWNLOAD\n")
  print(result$error)
} else {
  # save raw data
  saveRDS(result, file = here::here("data", "raw", "NALMS.rds"))
}

# Pull data from Quick Module Feedback
formData <- list("token"=Sys.getenv("Quick_Module_Feedback_45280"),
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
response <- httr::POST("https://redcap.chop.edu/api/", body = formData, encode = "form")
result <- httr::content(response, show_col_types = FALSE)

if(is.null(nrow(result))) {
  message("\nTHE DATA FROM Quick Module Feedback DID NOT DOWNLOAD\n")
  print(result$error)
} else {
  # save raw data
  saveRDS(result, file = here::here("data", "raw", "quick_module_feedback.rds"))
}
