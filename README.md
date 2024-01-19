# Analysis for the DART (Data and Analytics for Research Training) research project

Analysis for the DART research project, all waves.

In addition to this repository, there is a [Wave 1 analysis repo](https://github.com/arcus/DART_wave1_analysis) and a [Wave 2 analysis repo](https://github.com/arcus/DART_wave2_analysis). 
While in progress, we've relied on the analysis and reports in each of the separate repos but as we transition to reports that draw on data from both wave 1 and 2 as well as analyzing each separately, this repo will become the best reference.

The `participant_waves.csv` file provides a list of all record IDs for DART participants along with assigned wave (1 or 2). 
You can join this file to data files in order to filter for participants from only one wave.
Similarly, `participant_pathways.csv` provides pathway assignments (as strings) for all record IDs. 

## Findings

Reports summarizing analysis and findings are in `reports/notebooks`. 
For each report, there is a `.Rmd` version of the file and a `.md` version. 
The `.md` version is the "rendered" report, designed to be easy to read and to display well on github; they generally omit the code necessary to produce figures, etc. in order to keep the output tidy.
The `.Rmd` version is the "raw" file; if you want to see all of the code used to generate results and visualizations, that's the one you should look at.

Here are a few good ones to start with if you want an overview of our findings so far:

- [Results of our pre-registered hypothesis tests for Wave 2](reports/notebooks/w2_hypothesis_testing.md)
- [Report with figres etc. from our presentation at the R3ISE symposium, Nov 2023](reports/notebooks/R3ISE_symposium.md)
- [Report with figres etc. our Rigor Champions Prize submission, Dec 2023](reports/notebooks/rigor_champions_impact.md)

## How to use this repository

The code in this repository is stored in two places: `src/scripts` and `reports/notebooks`. 
Broadly, the code in `src/scripts` is general-purpose code to set up the analysis, such as downloading and cleaning the data, whereas the code in `reports/notebooks` is code to run tests and generate visualizations as needed for specific reports. 

There is a deidentified version of each data set available in `data/deidentified`. 
You will be able to replicate most (but not necessarily all) analyses just using the deidentified data.
To access the full data, you'll need API access to our REDCap projects.

### Getting the full data, with identifying fields

Participant data with identifying fields are **not** stored in this repository. 
The first time you clone this repository, you'll need to use your REDCap API tokens to download the raw data and then run the cleaning scripts before you can replicate any analyses using identifying participant data. 
Note the instructions about API tokens at the top of `01_redcap_api.R`.
If you don't have API access to the DART REDCap project, you won't be able to fully replicate the results on your own machine. 

To do download the raw data and clean it, open `src/scripts` and run each of the scripts there in order (the cleaning scripts are all saved starting with a number).  Note that if you like you can do this in a single command in the R console: 

`for(s in list.files(here::here("src", "scripts"), pattern = "^0", full.names = TRUE)) source(s)`

To check that the scripts ran okay, go to `data/interim` and you should see several .rds files there (or run `fs::dir_tree("data")`). 

### Running reports

Data are stored in `data/raw`, `data/deidentified`, and `data/interim`. 
If you clone the repository, you'll have only `data/deidentified`; if you also run all the cleaning scripts in `src/scripts`, you'll also have `data/raw` and `data/interim`.
Most reports begin by loading one or more data sets from `data/deidentified` or (if identifying fields are needed) `data/interim`.

Most reports knit to `github_document`, because that markdown formatting is what displays best on GitHub.

Most reports save images to `reports/figures` by using a `ggsave()` command instead of just using the knitr defaults to create automatic image files for each chunk. 
This makes it easier to reference the same image repeatedly across more than one report, and it allows more straightforward control over things like image size, aspect ratio, and image file names. 
It also means we can more easily use the standalone images from `reports/figures` in reports on other platforms (powerpoint presentations, etc.).

## Plan for dissemenation of code and data

- When we have code to share in support of e.g. a manuscript, upload the final code file(s) and deidentified data files to OSF or Zenodo, creating a DOI. Either way, make sure the code and data themselves or DOIs for them (if they're on Zenodo) are available via our OSF project page.
- When sharing information about the project as a research endeavor (vs connecting with learners or educators), link to our OSF project page https://osf.io/fc65h/ 

See [EDU-885](https://pm.arcus.chop.edu/browse/EDU-885) for history of work on this plan.

## To do

- Simplify NALMS report. It's currently copied almost exactly from the DART_wave2_analysis repo, and we should have a much pithier version here.
- Replace nested ifelses in participant_geocodes with case_whens
- See if `reports/notebooks/participant_description.Rmd` can be done with only deid data
- Add `lmerTest` to w2_hypothesis_testing.rmd
