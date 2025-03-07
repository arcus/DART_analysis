Pathways clustering
================
Rose Hartman
2023-01-17

``` r
waves <- readr::read_csv(here::here("participant_waves.csv"), show_col_types = FALSE)
```

Note that there are two important decisions inherent in the data
cleaning process for the likert items (rate your \[expertise/relevance
to your work/your desire to learn\] the following data science tasks):

- “Not Sure” responses are treated as missing
- All missing values (including Not Sure) are imputed with 1, the lowest
  value on the scale. In other words, when participants skipped an item
  or marked it “Not Sure” we’re treating that as them indicating “Very
  Low” expertise/relevance/desire to learn.

Also note that these items are being treated as continuous variables in
this analysis (i.e. the increase from “very low” to “low” is assumed to
be the same size as the increase from “low” to “medium”, and so on).

# Wave 1

## Load data

``` r
# load the cleaned needs assessment data
needs_assessment <- readRDS(here::here("data", "deidentified", "needs_assessment.rds")) |> 
  dplyr::left_join(waves, by = "record_id") |> 
  # only keep participants from the current wave
  dplyr::filter(wave == 1) |>
  dplyr::select(-wave)

# save just the items to be analyzed (the likert items) 
numeric_data <- dplyr::select(needs_assessment, -record_id)

# convert the record_id column to row names
row.names(numeric_data) <- dplyr::pull(needs_assessment, record_id)
```

    ## Warning: Setting row names on a tibble is deprecated.

``` r
# scale the data
numeric_data_scaled <- scale(numeric_data)
```

## Hierarchical Clustering

``` r
dist <- dist(numeric_data_scaled, method = "euclidean")
```

### Finding the clustering method

#### Ward’s

Minimizes the total **within cluster** variance.

From the docs:

> Two different algorithms are found in the literature for Ward
> clustering. The one used by option “ward.D” (equivalent to the only
> Ward option “ward” in R versions \<= 3.0.3) does not implement Ward’s
> (1963) clustering criterion, whereas option “ward.D2” implements that
> criterion (Murtagh and Legendre 2014). With the latter, the
> dissimilarities are squared before cluster updating. Note that
> agnes(*, method=“ward”) corresponds to hclust(*, “ward.D2”).

``` r
hc_ward <- hclust(dist, method = "ward.D2")
```

``` r
# Plot the result
plot(hc_ward, cex = 0.6, hang = -1)
```

#### Comparing dendograms

Calculate agglomerative coefficient (closer to 1 mean stronger
clustering structure)

``` r
m <- c("average", "single", "complete", "ward")
names(m) <- c( "average", "single", "complete", "ward")
purrr::map_dbl(m, ~ cluster::agnes(numeric_data_scaled, method = .)$ac) |>
  round(2)
```

    ##  average   single complete     ward 
    ##     0.58     0.46     0.72     0.82

Ward’s gives the best cluster cohesion.

``` r
# save a copy of the whole tree
saveRDS(hc_ward, file = here::here("data", "deidentified", "hclust_tree_w1.rds"))
```

### Assigning clusters

``` r
sub_grp4 <- cutree(hc_ward, k = 4)
sub_grp5 <- cutree(hc_ward, k = 5)
sub_grp6 <- cutree(hc_ward, k = 6)
sub_grp7 <- cutree(hc_ward, k = 7)
sub_grp8 <- cutree(hc_ward, k = 8)
sub_grp9 <- cutree(hc_ward, k = 9)
```

``` r
groups <- data.frame(record_id = as.numeric(names(sub_grp4)),
                     group4 = as.factor(sub_grp4), 
                     group5 = as.factor(sub_grp5),
                     group6 = as.factor(sub_grp6),
                     group7 = as.factor(sub_grp7),
                     group8 = as.factor(sub_grp8),
                     group9 = as.factor(sub_grp9))

# join cluster assignments to needs assessment data and save the file
dplyr::left_join(needs_assessment, groups, by = "record_id") |> 
  saveRDS(file = here::here("data", "deidentified", "needs_assessment_with_clusters_w1.rds"))
```

# Wave 2

## Load data

``` r
# load the cleaned needs assessment data
needs_assessment <- readRDS(here::here("data", "deidentified", "needs_assessment.rds")) |> 
  dplyr::left_join(waves, by = "record_id") |> 
  # only keep participants from the current wave
  dplyr::filter(wave == 2) |>
  dplyr::select(-wave)

# save just the items to be analyzed (the likert items) 
numeric_data <- dplyr::select(needs_assessment, -record_id)

# convert the record_id column to row names
row.names(numeric_data) <- dplyr::pull(needs_assessment, record_id)
```

    ## Warning: Setting row names on a tibble is deprecated.

``` r
# scale the data
numeric_data_scaled <- scale(numeric_data)
```

## Hierarchical Clustering

``` r
dist <- dist(numeric_data_scaled, method = "euclidean")
```

### Finding the clustering method

#### Ward’s

Minimizes the total **within cluster** variance.

From the docs:

> Two different algorithms are found in the literature for Ward
> clustering. The one used by option “ward.D” (equivalent to the only
> Ward option “ward” in R versions \<= 3.0.3) does not implement Ward’s
> (1963) clustering criterion, whereas option “ward.D2” implements that
> criterion (Murtagh and Legendre 2014). With the latter, the
> dissimilarities are squared before cluster updating. Note that
> agnes(*, method=“ward”) corresponds to hclust(*, “ward.D2”).

``` r
hc_ward <- hclust(dist, method = "ward.D2")
```

``` r
# Plot the result
plot(hc_ward, cex = 0.6, hang = -1)
```

#### Comparing dendograms

Calculate agglomerative coefficient (closer to 1 mean stronger
clustering structure)

``` r
m <- c("average", "single", "complete", "ward")
names(m) <- c( "average", "single", "complete", "ward")
purrr::map_dbl(m, ~ cluster::agnes(numeric_data_scaled, method = .)$ac) |>
  round(2)
```

    ##  average   single complete     ward 
    ##     0.59     0.39     0.74     0.91

Ward’s gives the best cluster cohesion.

``` r
# save a copy of the whole tree
saveRDS(hc_ward, file = here::here("data", "deidentified", "hclust_tree_w2.rds"))
```

### Assigning clusters

``` r
sub_grp04 <- cutree(hc_ward, k = 4)
sub_grp05 <- cutree(hc_ward, k = 5)
sub_grp06 <- cutree(hc_ward, k = 6)
sub_grp07 <- cutree(hc_ward, k = 7)
sub_grp08 <- cutree(hc_ward, k = 8)
sub_grp09 <- cutree(hc_ward, k = 9)
sub_grp10 <- cutree(hc_ward, k = 10)
sub_grp11 <- cutree(hc_ward, k = 11)
sub_grp12 <- cutree(hc_ward, k = 12)
sub_grp13 <- cutree(hc_ward, k = 13)
sub_grp14 <- cutree(hc_ward, k = 14)
sub_grp15 <- cutree(hc_ward, k = 15)
sub_grp16 <- cutree(hc_ward, k = 16)
sub_grp17 <- cutree(hc_ward, k = 17)
sub_grp18 <- cutree(hc_ward, k = 18)
sub_grp19 <- cutree(hc_ward, k = 19)
sub_grp20 <- cutree(hc_ward, k = 20)
```

``` r
groups <- data.frame(record_id = as.numeric(names(sub_grp04)),
                     group04 = as.factor(sub_grp04), 
                     group05 = as.factor(sub_grp05),
                     group06 = as.factor(sub_grp06),
                     group07 = as.factor(sub_grp07),
                     group08 = as.factor(sub_grp08),
                     group09 = as.factor(sub_grp09),
                     group10 = as.factor(sub_grp10),
                     group11 = as.factor(sub_grp11),
                     group12 = as.factor(sub_grp12),
                     group13 = as.factor(sub_grp13),
                     group14 = as.factor(sub_grp14),
                     group15 = as.factor(sub_grp15),
                     group16 = as.factor(sub_grp16),
                     group17 = as.factor(sub_grp17),
                     group18 = as.factor(sub_grp18),
                     group19 = as.factor(sub_grp19),
                     group20 = as.factor(sub_grp20))

# join cluster assignments to needs assessment data and save the file
dplyr::left_join(needs_assessment, groups, by = "record_id") |> 
  saveRDS(file = here::here("data", "deidentified", "needs_assessment_with_clusters_w2.rds"))
```
