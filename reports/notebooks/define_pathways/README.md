This subdirectory contains files and reports for generating pathway assignments for the DART study, for both waves 1 and 2. 
The process includes the following steps: 

1. Apply hierarchical clustering to the data from the needs assessment survey to identify groups of learners with similar needs/interests: `define_clusters.rmd`
2. Examine patterns within each cluster of learners to get an overall picture of what characterizes each group (note that this also involves proposing a place to cut the clustering tree, i.e. how many clusters to keep): `explore_clusters_w1.rmd` and `explore_clusters_w2.rmd`
3. Read through the descriptions of each cluster and consider them against the available content in our catalog of learning modules. For each cluster, propose a pathway of modules that would meet their needs (if needed, can revise the number of clusters at this point): `proposed_pathways_w1.md` and `proposed_pathways_w2.md`

Once the pathway assignments are finalized, pathway assignments are entered back into the learner platform -- for wave 1 this was Thinkific, for wave 2 it was [NALMS](https://github.com/arcus/NALMS_Not_Another_LMS) -- and also saved in the main REDCap project for this study (DART Pipeline, pid=56668). 
