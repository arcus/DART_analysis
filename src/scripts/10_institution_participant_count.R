# Get number of unique institutions per Wave

institution_count <- readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  dplyr::filter(redcap_event_name == "screening_arm_1") |> 
  dplyr::select(record_id, wave, institution, email, email_secondary) |> 
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
                                                     TRUE ~ institution)) |>
  dplyr::group_by(wave, institution_clean) |>
  dplyr::count()

# Get stats on number of participants and institutions 

# Wave 1 number of institutions

institution_count |>
  dplyr::filter(wave == 1) |>
  nrow()

# Wave 1 number of participants

institution_count |>
  dplyr::filter(wave == 1) |>
  dplyr::pull(n) |>
  sum()

# Wave 2 number of institutions

institution_count |>
  dplyr::filter(wave == 2) |>
  nrow()

# Wave 2 number of participants

institution_count |>
  dplyr::filter(wave == 2) |>
  dplyr::pull(n) |>
  sum()
