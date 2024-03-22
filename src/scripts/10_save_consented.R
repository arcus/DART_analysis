# Save list of participants who completed enrollment, strictly speaking.
# They may or may not have gone on to finish the needs assessment,
# so they might not have finished the enrollment EVENT.  But they
# gave their consent and agreed to the code of conduct.

enrollment <- readRDS(here::here("data", "raw", "DART_Pipeline.rds")) |> 
  # don't include any identifying information, so we can post this on GH
  dplyr::filter(redcap_event_name == "enroll_and_assign_arm_1",
                consent == 1, conduct == 1, enrollment_complete == 2) |>
  dplyr::select(record_id, consent, conduct) |>  # saved cleaned data
  saveRDS(file = here::here("data", "interim", "consented.rds"))

# save a de-identified version that we can share (the function save_data_deid is defined in functions_data_cleaning.R)
save_data_deid("consented")
