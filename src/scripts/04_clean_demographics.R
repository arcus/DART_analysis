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
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "demographics.rds"))

institutions <- readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  dplyr::filter(redcap_event_name == "screening_arm_1") |> 
  dplyr::select(record_id, institution, email, email_secondary) |> 
  dplyr::mutate(email = tolower(email),
                email_secondary = tolower(email_secondary),
                institution = tolower(institution)) |> 
  tidyr::extract(email, into="email_domain", regex = "^.*@(.*)[.][[:alpha:]]+$", remove = TRUE) |> 
  tidyr::extract(email_secondary, into="email_secondary_domain", regex = "^.*@(.*)[.][[:alpha:]]+$", remove = TRUE) |> 
  dplyr::mutate(institution_clean = dplyr::case_when(grepl(pattern = "chop", institution) ~ "CHOP",
                                               grepl(pattern = "children.* hospital of phil", institution) ~ "CHOP",
                                               grepl(pattern = "dbhi", institution) ~ "CHOP",
                                               grepl(pattern = "chop", email_domain) ~ "CHOP",
                                               grepl(pattern = "boston children", institution) ~ "Boston Children's Hospital",
                                               grepl(pattern = "cincinnati children", institution) ~ "Cincinnati Children's Hospital",
                                               grepl(pattern = "nationwide children", institution) ~ "Nationwide Children's Hospital",
                                               grepl(pattern = "mass[[:alpha:]]* gen", institution) ~ "Massachusetts General Hospital",
                                               grepl(pattern = "upenn", email_domain) ~ "Penn",
                                               grepl(pattern = "upenn", institution) ~ "Penn",
                                               grepl(pattern = "penn medicine", institution) ~ "Penn",
                                               grepl(pattern = "u[[:alpha:]]* of penn", institution) ~ "Penn",
                                               grepl(pattern = "penn.* state", institution) ~ "Penn State",
                                               grepl(pattern = "baylor.* me", institution) ~ "Baylor College of Medicine",
                                               grepl(pattern = "bcm", institution) ~ "Baylor College of Medicine",
                                               grepl(pattern = "u[[:alpha:]]* of botswana", institution) ~ "University of Botswana",
                                               grepl(pattern = "botho u[[:alpha:]]*", institution) ~ "Botho University, Botswana",
                                               grepl(pattern = "kilimanjaro", institution) ~ "Kilimanjaro Christian Medical University College",
                                               grepl(pattern = "blida 1 u[[:alpha:]]*", institution) ~ "Blida 1 University",
                                               grepl(pattern = "bowie state", institution) ~ "Bowie State University",
                                               grepl(pattern = "morehouse", institution) ~ "Morehouse University",
                                               grepl(pattern = "la[ ]*salle", institution) ~ "La Salle University",
                                               grepl(pattern = "imam abdulrahman bin faisal", institution) ~ "Imam Abdulrahman Bin Faisal University",
                                               grepl(pattern = "u[[:alpha:]]* of texas", institution) ~ "University of Texas",
                                               grepl(pattern = "u[[:alpha:]]* of tenn", institution) ~ "University of Tennessee",
                                               grepl(pattern = "uthsc", institution) ~ "University of Tennessee",
                                               grepl(pattern = "u[[:alpha:]]* of delaware", institution) ~ "University of Delaware",
                                               grepl(pattern = "u[[:alpha:]]* of mumbai", institution) ~ "University of Mumbai",
                                               grepl(pattern = "u[[:alpha:]]* of ruhuna", institution) ~ "University of Ruhuna",
                                               grepl(pattern = "u[[:alpha:]]* of north carolina", institution) ~ "University of North Carolina",
                                               grepl(pattern = "u[[:alpha:]]* of missouri", institution) ~ "University of Missouri",
                                               grepl(pattern = "u[[:alpha:]]* of minnesota", institution) ~ "University of Minnesota",
                                               grepl(pattern = "u[[:alpha:]]* of ariz", institution) ~ "University of Arizona",
                                               grepl(pattern = "u[[:alpha:]]* of alabama", institution) ~ "University of Alabama",
                                               grepl(pattern = "u[[:alpha:]]* of new mex", institution) ~ "University of New Mexico",
                                               grepl(pattern = "u[[:alpha:]]* of houston", institution) ~ "University of Houston",
                                               grepl(pattern = "u[[:alpha:]]* of mich", institution) ~ "University of Michigan",
                                               grepl(pattern = "u[[:alpha:]]* of utah", institution) ~ "University of Utah",
                                               grepl(pattern = "u[[:alpha:]]* of massa", institution) ~ "University of Massachusetts",
                                               grepl(pattern = "u[[:alpha:]]* of georgia", institution) ~ "University of Georgia",
                                               grepl(pattern = "u[[:alpha:]]* of maryland", institution) ~ "University of Maryland",
                                               grepl(pattern = "u[[:alpha:]]* of arkan", institution) ~ "University of Arkansas",
                                               grepl(pattern = "u[[:alpha:]]* of wash", institution) ~ "University of Washington",
                                               grepl(pattern = "new york u[[:alpha:]]*", institution) ~ "New York University",
                                               grepl(pattern = "columbia u[[:alpha:]]*", institution) ~ "Columbia University",
                                               grepl(pattern = "arizona state", institution) ~ "Arizona State University",
                                               grepl(pattern = "johns hopkin", institution) ~ "Johns Hopkins",
                                               grepl(pattern = "duke", institution) ~ "Duke University",
                                               grepl(pattern = "juntendo", institution) ~ "Juntendo University",
                                               grepl(pattern = "drexel", institution) ~ "Drexel University",
                                               grepl(pattern = "harvard", institution) ~ "Harvard University",
                                               grepl(pattern = "beth israel deaconess", institution) ~ "Harvard University",
                                               grepl(pattern = "villanova", institution) ~ "Villanova University",
                                               grepl(pattern = "carnegie mellon", institution) ~ "Carnegie Mellon University",
                                               grepl(pattern = "sloan kettering", institution) ~ "Sloan Kettering Institute",
                                               grepl(pattern = "mskcc", institution) ~ "Sloan Kettering Institute",
                                               grepl(pattern = "mskcc", email_domain) ~ "Sloan Kettering Institute",
                                               grepl(pattern = "cornell", institution) ~ "Cornell University",
                                               grepl(pattern = "imperial college lo", institution) ~ "Imperial College London",
                                               grepl(pattern = "rowan u[[:alpha:]]*", institution) ~ "Rowan University",
                                               grepl(pattern = "clemson", institution) ~ "Clemson University",
                                               grepl(pattern = "stanford", institution) ~ "Stanford University",
                                               grepl(pattern = "princeton", institution) ~ "Princeton University",
                                               grepl(pattern = "fox[ ]*chase", institution) ~ "Fox Chase Cancer Center",
                                               grepl(pattern = "princess[ ]*marina", institution) ~ "Princess Marina Hospital",
                                               grepl(pattern = "kaiser[ ]*permanente", institution) ~ "Kaiser Permanente",
                                               grepl(pattern = "rutgers", institution) ~ "Rutgers",
                                               grepl(pattern = "wistar", institution) ~ "The Wistar Institute",
                                               grepl(pattern = "m[ ]*d anderson", institution) ~ "MD Anderson",
                                               grepl(pattern = "uthealth", institution) ~ "Houston misc",
                                               grepl(pattern = "houston", institution) ~ "Houston misc",
                                               grepl(pattern = "monell", institution) ~ "Philadelphia misc",
                                               grepl(pattern = "temple", institution) ~ "Temple University",
                                               grepl(pattern = "emory", institution) ~ "Emory University",
                                               grepl(pattern = "hampton", institution) ~ "Hampton University",
                                               grepl(pattern = "georgia state", institution) ~ "Georgia State University",
                                               grepl(pattern = "morgan state", institution) ~ "Morgan State University",
                                               grepl(pattern = "national cheng kung", institution) ~ "National Cheng Kung University",
                                               grepl(pattern = "nepal research and collaboration center", institution) ~ "Nepal Research and Collaboration Center",
                                               grepl(pattern = "ohsu", institution) ~ "OHSU",
                                               grepl(pattern = "utsa", institution) ~ "University of Texas at San Antonio",
                                               grepl(pattern = "mricd", institution) ~ "MRICD",
                                               grepl(pattern = "merck", institution) ~ "Merck",
                                               grepl(pattern = "medical college .* wis", institution) ~ "Medical College of Wisconsin",
                                               grepl(pattern = "harvard", email_domain) ~ "Harvard University",
                                               grepl(pattern = "umbc", email_domain) ~ "University of Maryland",
                                               grepl(pattern = "udel", email_domain) ~ "University of Delaware",
                                               grepl(pattern = "nih", institution) ~ "NIH",
                                               grepl(pattern = "chop", email_secondary_domain) ~ "CHOP",
                                               grepl(pattern = "upenn", email_secondary_domain) ~ "Penn",
                                               grepl(pattern = "harvard", email_secondary_domain) ~ "Harvard University",
                                               grepl(pattern = "umbc", email_secondary_domain) ~ "University of Maryland",
                                               TRUE ~ institution)) 

# join geocoding info on institutions
institutions |> 
  dplyr::select(institution = institution_clean) |> 
  unique() |> 
  readr::write_csv("locations.csv")

# manually add city information for each institution, then read it back in
locations <- readr::read_csv("locations_with_address.csv") |> 
  tidygeocoder::geocode(address = address)

institutions |> 
  dplyr::select(record_id, institution = institution_clean) |> 
  dplyr::left_join(locations, by = "institution") |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "participant_geocodes.rds"))
