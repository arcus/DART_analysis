source(here::here("src", "scripts", "functions_data_cleaning.R"))

# need to update this list as we publish new modules
name_id_pairs <- tibble::tribble(
  ~module_id, ~module_name,
  "bash_103_combining_commands",   "bash combining commands",
  "bash_command_line_101",   "bash command line 101",
  "bash_command_line_102",   "bash searching and organizing files",
  "bash_conditionals_loops",   "bash conditionals and loops",
  "bash_scripts",   "bash reusable scripts",
  "bias_variance_tradeoff",   "understanding the bias-variance tradeoff",
  "citizen_science",   "citizen science",
  "data_management_basics",   "research data management basics",
  "data_storage_models",   "types of data storage models",
  "data_visualization_in_ggplot2",   "data visualizations in ggplot2",
  "data_visualization_in_open_source_software",   "data visualization in open source software",
  "data_visualization_in_seaborn",   "data visualizations in seaborn",
  "database_normalization",   "database normalization",
  "demystifying_apis",   "demystifying application programming interfaces (apis)",
  "demystifying_command_line",   "demystifying the command line interface",
  "demystifying_containers",   "demystifying containers",
  "demystifying_geospatial_data",   "demystifying geospatial data",
  "demystifying_large_language_models",   "demystifying large language models",
  "demystifying_machine_learning",   "demystifying machine learning",
  "demystifying_python",   "demystifying python",
  "demystifying_regular_expressions",   "demystifying regular expressions",
  "demystifying_sql",   "demystifying sql",
  "directories_and_file_paths",   "directories and file paths",
  "docker_101",   "getting started with docker for research",
  "elements_of_maps",   "elements of maps",
  "generalized_linear_regression",   "generalized linear regression",
  "genomics_quality_control",   "genomics tools and methods quality control",
  "genomics_setup",   "genomics tools and methods computing setup",
  "geocode_lat_long",   "encoding geospatial data latitude and longitude",
  "git_cli_vs_gui",   "git command line interface versus graphical user interface",
  "git_creation_and_tracking",   "creating your git repository",
  "git_history_of_project",   "exploring the history of your git repository",
  "git_intro",   "intro to version control",
  "git_setup_mac_and_linux",   "setting up git on mac and linux",
  "git_setup_windows",   "setting up git on windows",
  "how_to_troubleshoot",   "how to troubleshoot",
  "intro_to_nhst",   "introduction to null hypothesis significance testing",
  "learning_to_learn",   "learning to learn data science",
  "omics_orientation",   "omics orientation",
  "pandas_transform",   "transform data with pandas",
  "python_basics", "python basics  writing python code",
  "python_basics_exercise",   "python basics exercise",
  "python_basics_lists_dictionaries",   "python basics lists and dictionaries",
  "python_basics_loops_conditionals",   "python basics loops and conditionals",
  "python_basics_variables_functions_methods",   "python basics functions, methods, and variables",
  "python_practice",   "python practice",
  "r_basics_introduction",   "r basics introduction",
  "r_basics_practice",   "r basics practice",
  "r_basics_transform_data",   "r basics transforming data with dplyr",
  "r_basics_visualize_data",   "r basics visualizing data with ggplot2",
  "r_missing_values",   "missing values in r",
  "r_practice",   "r practice",
  "r_reshape_long_wide",   "reshaping data in r long and wide data",
  "r_summary_stats",   "summary statistics in r",
  "regular_expressions_basics",   "regular expressions basics",
  "regular_expressions_boundaries_anchors",   "regular expressions flags, anchors, and boundaries",
  "regular_expressions_groups",   "regular expressions groups",
  "regular_expressions_lookaheads",   "regular expressions lookaheads",
  "reproducibility",   "reproducibility, generalizability, and reuse",
  "sql_basics",   "sql basics",
  "sql_intermediate",   "sql intermediate",
  "sql_joins",   "sql joins",
  "statistical_tests",   "statistical tests in open source software",
  "tidy_data",   "tidy data",
  "using_redcap_api",   "using the redcap api"
) |> 
  dplyr::mutate(module_id = as.factor(module_id))

readRDS(here::here("data", "raw", "quick_module_feedback.rds")) |> 
  dplyr::mutate(date = lubridate::floor_date(feedback_timestamp, unit = "days")) |> 
  # we added pilot_participant after cohort, so responses with non-missing values for cohort should be backfilled as pilots
  dplyr::mutate(pilot_participant = ifelse(is.na(pilot_participant) & !is.na(cohort), "yes", pilot_participant)) |> 
  tidyr::replace_na(list(research_participant_yn = 0, 
                         pilot_participant = "no")) |> 
  dplyr::mutate(type = dplyr::case_when(research_participant_yn == 1 ~ "Study Participants",
                                        pilot_participant == "yes" ~ "Study Participants", 
                                        research_participant_yn == 0 & pilot_participant == "no" ~ "Other Users"),
                type = as.factor(type)) |> 
  # if version is missing, put in 1.0.0
  dplyr::mutate(version = ifelse(is.na(version), "1.0.0", version)) |> 
  # clean up factors
  dplyr::mutate(learning_objectives = factor(learning_objectives, levels = c(0, 1), labels = c("no", "yes")),
                chop_affiliation = factor(chop_affiliation, levels = 1:3, labels = c("currently affiliated with CHOP", "previously/formerly affiliated with CHOP", "never been affiliated with CHOP")),
                version = as.factor(version),
                module_type = as.factor(module_type)) |> 
  # module_name used to include quotes, now it doesn't. remove all the quotes to make it consistent.
  dplyr::mutate(module_name = gsub(x = module_name, pattern = '"', replacement = ''),
                module_name = tolower(module_name),
                module_name = gsub(x = module_name, pattern = ":", replacement = "")) |> 
  # cleanup module names that have changed over time
  dplyr::mutate(module_name = dplyr::case_when(
    module_name == "bash / command line" ~ "bash command line 101",
    module_name == "bash / command line 101" ~ "bash command line 101",
    module_name == "bash loops and conditional statements" ~ "bash conditionals and loops",
    module_name == "creating a git repository" ~ "creating your git repository",
    module_name == "data visualization in ggplot2" ~ "data visualizations in ggplot2",
    module_name == "data visualization in seaborn" ~ "data visualizations in seaborn",
    module_name == "the elements of maps" ~ "elements of maps",
    module_name == "learning how to learn data science" ~ "learning to learn data science",
    module_name == "r basics transform data" ~ "r basics transforming data with dplyr",
    module_name == "r basics visualize data" ~ "r basics visualizing data with ggplot2",
    module_name == "reproducibility, generalized data structures , and reuse" ~ "reproducibility, generalizability, and reuse",
    module_name == "reproducibility, generalizability, and reuse how technology can help" ~ "reproducibility, generalizability, and reuse",
    module_name == "setting up git for mac and linux" ~ "setting up git on mac and linux",
    module_name == "sql, intermediate level" ~ "sql intermediate",
    module_name == "sql joins demystified" ~ "sql joins",
    TRUE ~ module_name),
    module_name = as.factor(module_name)) |> 
  # replace the original module_id column with left_join from name_id_pairs
  dplyr::select(-module_id) |> 
  dplyr::left_join(name_id_pairs, by = "module_name") |> 
  dplyr::mutate(module_id = as.factor(module_id)) |> 
  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "quick_module_feedback.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("quick_module_feedback")
