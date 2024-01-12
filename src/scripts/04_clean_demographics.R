source(here::here("src", "scripts", "functions_data_cleaning.R"))

highest_degree_labels <- c("Little or no formal schooling", "Elementary school or equivalent", "Middle school or equivalent", "High school or equivalent", "Some college", "Undergraduate degree", "Some graduate school", "Graduate degree", "Doctoral degree")
career_stage_labels <- c("Student (PhD, MD)", "Postdoc, MD resident, MD fellow", "Junior faculty", "Established faculty", "Research staff", "Other")
# student, Student working toward a PhD, MD, or other terminal degree in a biomedical domain | fellow, Postdoc, MD resident, MD fellow, or other early career trainee | faculty_jun, Junior faculty | faculty_est, Established faculty | staff, Research staff with or without terminal degree | other, Other (please describe)

readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  dplyr::filter(redcap_event_name == "pre_arm_1") |> 
  # pull out record_id, and demographic fields
  dplyr::select(record_id, career_stage:year_of_highest_degree_1) |> 
  dplyr::mutate(career_stage = factor(career_stage, 
                                      levels = c("student", "fellow", "faculty_jun", "faculty_est", "staff", "other"),
                                      labels = career_stage_labels),
                highest_degree = factor(highest_degree_1, 
                                        levels = 1:9, 
                                        labels = highest_degree_labels)) |> 
  # recode to match NIH ethnicity
  dplyr::mutate(ethnicity = ifelse(ethnicity___hispanic == 1, "Hispanic or Latino", 
                                   ifelse(ethnicity___notsay == 1, NA, "Not Hispanic or Latino")),
                ethnicity = as.factor(ethnicity)) |> 
  # multiple races
  dplyr::rowwise() |> 
  dplyr::mutate(race_count = sum(ethnicity___amindian, ethnicity___asian, ethnicity___black, ethnicity___hawaiian, ethnicity___white)) |> 
  # recode race responses to match NIH categories
  dplyr::mutate(race = ifelse(race_count > 1, "More than One Race", 
                              ifelse(ethnicity___amindian == 1, "American Indian/Alaska Native", 
                                     ifelse(ethnicity___asian == 1, "Asian", 
                                            ifelse(ethnicity___black == 1, "Black or African American",
                                                   ifelse(ethnicity___hawaiian == 1, "Native Hawaiian or Other Pacific Islander",
                                                          ifelse(ethnicity___white == 1, "White", NA)))))),
                race = as.factor(race)) |> 
  # gender
  dplyr::mutate(gender = tolower(gender),
                gender_coded = ifelse(grepl(x=gender, pattern = "non[-]*binary"), "Non-Binary, Agender, Genderqueer, or Gender Non-Conforming", 
                                      ifelse(is.na(gender), NA,
                                             ifelse(gender == "f", "Female",
                                                    ifelse(gender == "m", "Male",
                                                           ifelse(grepl(x=gender, pattern = "wom|fem|she|her"), "Female",
                                                                  ifelse(grepl(x=gender, pattern = "man|male|he|him"), "Male",
                                                                         "Non-Binary, Agender, Genderqueer, or Gender Non-Conforming")))))),
                gender_coded = as.factor(gender_coded)) |> 
  # under-represented? https://grants.nih.gov/grants/guide/notice-files/NOT-OD-20-031.html
  # "Blacks or African Americans, Hispanics or Latinos, American Indians or Alaska Natives, Native Hawaiians and other Pacific Islanders"
  dplyr::mutate(underrepresented = ifelse(ethnicity___black == 1 | ethnicity___hispanic == 1 | ethnicity___amindian == 1 | ethnicity___hawaiian == 1, "Underrepresented", "Not Underrepresented"),
                underrepresented = as.factor(underrepresented)) |> 
  dplyr::select(record_id, gender, gender_coded, race, ethnicity, underrepresented, everything()) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "demographics.rds"))

# IMPORTANT
# On each update of the data, check all the coding of gender responses
readRDS(here::here("data", "interim", "demographics.rds")) |> 
  dplyr::select(gender, gender_coded) |> unique() |> View()

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("demographics")
