These scripts contain all the code needed to create the data needed to replicate analyses in the `reports/notebooks` directory. 
To go from raw data to analysis files, run the scripts here in order (start with 00_setup.R, then 01_redcap_api.R, etc.). 
You will need API access to the REDCap projects where the raw data are. 

The scripts `functions_data_cleaning.R` and `functions_plotting.R` each contain a handful of custom functions used in the data cleaning or analysis code for this project. 
When custom functions are used, they are generally accompanied by a comment noting that they are saved in `functions_data_cleaning.R` or `functions_plotting.R`.
They will also be called with `source()` at the beginning of the file using them. 
