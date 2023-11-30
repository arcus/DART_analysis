# DART_analysis

Analysis for the DART research project, all waves.

In addition to this repository, there is a [Wave 1 analysis repo](https://github.com/arcus/DART_wave1_analysis) and a [Wave 2 analysis repo](https://github.com/arcus/DART_wave2_analysis). 
While in progress, we've relied on the analysis and reports in each of the separate repos but as we transition to reports that draw on data from both wave 1 and 2 as well as analyzing each separately, this repo will become the best reference.

The `participant_waves.csv` file provides a list of all record IDs for DART participants along with assigned wave (1 or 2). 
You can join this file to data files in order to filter for participants from only one wave.
Similarly, `participant_pathways.csv` provides pathway assignments (as strings) for all record IDs. 

## How to use this repository

The code in this repository is stored in two places: `src/scripts` and `reports/notebooks`. 
Broadly, the code in `src/scripts` is general-purpose code to set up the analysis, such as downloading and cleaning the data, whereas the code in `reports/notebooks` is code to run tests and generate visualizations as needed for specific reports. 

## Initial setup

Participant data are not stored in this repository. 
The first time you clone this repository, you'll need to use your REDCap API tokens to download the raw data and then run the cleaning scripts before you can replicate any analyses. 

To do that, open `src/scripts` and run each of the scripts there in order (the cleaning scripts are all saved starting a number). 
Note the instructions about API tokens at the top of `01_redcap_api.R`.

## Running reports

Once you've run all the cleaning scripts, you'll have local copies saved of all the data you need. 
Data are stored in `data/raw` and `data/interim`. 
Most reports begin by loading one or more data sets from `data/interim`.

Most reports knit to `github_document`, because that markdown formatting is what displays best on GitHub.

Most reports save images to `reports/figures` by using a `ggsave()` command instead of just using the knitr defaults to create automatic image files for each chunk. 
This makes it easier to reference the same image repeatedly across more than one report, and it allows more straightforward control over things like image size, aspect ratio, and image file names. 
It also means we can more easily use the standalone images from `reports/figures` in reports on other platforms (powerpoint presentations, etc.).

## To do

- Simplify NALMS report. It's currently copied almost exactly from the DART_wave2_analysis repo, and we should have a much pithier version here.
