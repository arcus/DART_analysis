Explore clusters
================
Rose Hartman
2023-01-17

``` r
needs_assessment_long <- readRDS(here::here("data", "deidentified", "needs_assessment_with_clusters_w1.rds")) |> 
  # reformat to long
  tidyr::pivot_longer(cols = tidyselect::matches("_relevance|_expertise|_learn")) |> 
  # separate topic (e.g. data_viz) from question type (relevance, expertise, or learn)
  tidyr::extract(name, into = c("topic", "question"), regex = "(.*)_([[:lower:]]+)", remove = TRUE) |> 
  dplyr::mutate(question = factor(question, levels = c("relevance", "expertise", "learn")),
                topic = as.factor(topic))
```

## distributions by cluster

``` r
plot_by_theme(needs_assessment_long, cluster = group4)
```

    ## $counts
    ## # A tibble: 4 × 2
    ##   cluster     n
    ##   <fct>   <int>
    ## 1 1          54
    ## 2 2          20
    ## 3 3          13
    ## 4 4          10
    ## 
    ## $data_types

<img src="explore_clusters_w1_files/figure-gfm/four_clusters-1.png" width="50%" />

    ## 
    ## $techniques

<img src="explore_clusters_w1_files/figure-gfm/four_clusters-2.png" width="50%" />

    ## 
    ## $tools

<img src="explore_clusters_w1_files/figure-gfm/four_clusters-3.png" width="50%" />

``` r
plot_by_theme(needs_assessment_long, cluster = group5)
```

    ## $counts
    ## # A tibble: 5 × 2
    ##   cluster     n
    ##   <fct>   <int>
    ## 1 1          27
    ## 2 2          20
    ## 3 3          27
    ## 4 4          13
    ## 5 5          10
    ## 
    ## $data_types

<img src="explore_clusters_w1_files/figure-gfm/five_clusters-1.png" width="50%" />

    ## 
    ## $techniques

<img src="explore_clusters_w1_files/figure-gfm/five_clusters-2.png" width="50%" />

    ## 
    ## $tools

<img src="explore_clusters_w1_files/figure-gfm/five_clusters-3.png" width="50%" />

``` r
plot_by_theme(needs_assessment_long, cluster = group6)
```

    ## $counts
    ## # A tibble: 6 × 2
    ##   cluster     n
    ##   <fct>   <int>
    ## 1 1           9
    ## 2 2          20
    ## 3 3          27
    ## 4 4          13
    ## 5 5          10
    ## 6 6          18
    ## 
    ## $data_types

<img src="explore_clusters_w1_files/figure-gfm/six_clusters-1.png" width="50%" />

    ## 
    ## $techniques

<img src="explore_clusters_w1_files/figure-gfm/six_clusters-2.png" width="50%" />

    ## 
    ## $tools

<img src="explore_clusters_w1_files/figure-gfm/six_clusters-3.png" width="50%" />

``` r
plot_by_theme(needs_assessment_long, cluster = group7)
```

    ## $counts
    ## # A tibble: 7 × 2
    ##   cluster     n
    ##   <fct>   <int>
    ## 1 1           9
    ## 2 2          20
    ## 3 3          27
    ## 4 4           2
    ## 5 5          11
    ## 6 6          10
    ## 7 7          18
    ## 
    ## $data_types

<img src="explore_clusters_w1_files/figure-gfm/seven_clusters-1.png" width="50%" />

    ## 
    ## $techniques

<img src="explore_clusters_w1_files/figure-gfm/seven_clusters-2.png" width="50%" />

    ## 
    ## $tools

<img src="explore_clusters_w1_files/figure-gfm/seven_clusters-3.png" width="50%" />

``` r
plot_by_theme(needs_assessment_long, cluster = group8)
```

    ## $counts
    ## # A tibble: 8 × 2
    ##   cluster     n
    ##   <fct>   <int>
    ## 1 1           9
    ## 2 2          20
    ## 3 3          18
    ## 4 4           2
    ## 5 5          11
    ## 6 6           9
    ## 7 7          10
    ## 8 8          18
    ## 
    ## $data_types

<img src="explore_clusters_w1_files/figure-gfm/eight_clusters-1.png" width="50%" />

    ## 
    ## $techniques

<img src="explore_clusters_w1_files/figure-gfm/eight_clusters-2.png" width="50%" />

    ## 
    ## $tools

<img src="explore_clusters_w1_files/figure-gfm/eight_clusters-3.png" width="50%" />

``` r
plot_by_theme(needs_assessment_long, cluster = group9)
```

    ## $counts
    ## # A tibble: 9 × 2
    ##   cluster     n
    ##   <fct>   <int>
    ## 1 1           9
    ## 2 2          20
    ## 3 3          18
    ## 4 4           2
    ## 5 5          11
    ## 6 6           9
    ## 7 7          10
    ## 8 8          12
    ## 9 9           6
    ## 
    ## $data_types

<img src="explore_clusters_w1_files/figure-gfm/nine_clusters-1.png" width="50%" />

    ## 
    ## $techniques

<img src="explore_clusters_w1_files/figure-gfm/nine_clusters-2.png" width="50%" />

    ## 
    ## $tools

<img src="explore_clusters_w1_files/figure-gfm/nine_clusters-3.png" width="50%" />

## Which topics are most important to each cluster?

for each cluster, rank topics by desire to learn, expertise, or
relevance

### 4 cluster solution

``` r
rank_topics(needs_assessment_long, cluster = group4, n_cluster = 4)
```

    ## [[1]]
    ## [[1]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/four_topics-1.png" width="50%" />

    ## 
    ## [[1]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/four_topics-2.png" width="50%" />

    ## 
    ## [[1]]$learn

<img src="explore_clusters_w1_files/figure-gfm/four_topics-3.png" width="50%" />

    ## 
    ## 
    ## [[2]]
    ## [[2]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/four_topics-4.png" width="50%" />

    ## 
    ## [[2]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/four_topics-5.png" width="50%" />

    ## 
    ## [[2]]$learn

<img src="explore_clusters_w1_files/figure-gfm/four_topics-6.png" width="50%" />

    ## 
    ## 
    ## [[3]]
    ## [[3]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/four_topics-7.png" width="50%" />

    ## 
    ## [[3]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/four_topics-8.png" width="50%" />

    ## 
    ## [[3]]$learn

<img src="explore_clusters_w1_files/figure-gfm/four_topics-9.png" width="50%" />

    ## 
    ## 
    ## [[4]]
    ## [[4]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/four_topics-10.png" width="50%" />

    ## 
    ## [[4]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/four_topics-11.png" width="50%" />

    ## 
    ## [[4]]$learn

<img src="explore_clusters_w1_files/figure-gfm/four_topics-12.png" width="50%" />

### 5 cluster solution

``` r
rank_topics(needs_assessment_long, cluster = group5, n_cluster = 5)
```

    ## [[1]]
    ## [[1]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/five_topics-1.png" width="50%" />

    ## 
    ## [[1]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/five_topics-2.png" width="50%" />

    ## 
    ## [[1]]$learn

<img src="explore_clusters_w1_files/figure-gfm/five_topics-3.png" width="50%" />

    ## 
    ## 
    ## [[2]]
    ## [[2]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/five_topics-4.png" width="50%" />

    ## 
    ## [[2]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/five_topics-5.png" width="50%" />

    ## 
    ## [[2]]$learn

<img src="explore_clusters_w1_files/figure-gfm/five_topics-6.png" width="50%" />

    ## 
    ## 
    ## [[3]]
    ## [[3]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/five_topics-7.png" width="50%" />

    ## 
    ## [[3]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/five_topics-8.png" width="50%" />

    ## 
    ## [[3]]$learn

<img src="explore_clusters_w1_files/figure-gfm/five_topics-9.png" width="50%" />

    ## 
    ## 
    ## [[4]]
    ## [[4]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/five_topics-10.png" width="50%" />

    ## 
    ## [[4]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/five_topics-11.png" width="50%" />

    ## 
    ## [[4]]$learn

<img src="explore_clusters_w1_files/figure-gfm/five_topics-12.png" width="50%" />

    ## 
    ## 
    ## [[5]]
    ## [[5]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/five_topics-13.png" width="50%" />

    ## 
    ## [[5]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/five_topics-14.png" width="50%" />

    ## 
    ## [[5]]$learn

<img src="explore_clusters_w1_files/figure-gfm/five_topics-15.png" width="50%" />

### 6 cluster solution

``` r
rank_topics(needs_assessment_long, cluster = group6, n_cluster = 6)
```

    ## [[1]]
    ## [[1]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/six_topics-1.png" width="50%" />

    ## 
    ## [[1]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/six_topics-2.png" width="50%" />

    ## 
    ## [[1]]$learn

<img src="explore_clusters_w1_files/figure-gfm/six_topics-3.png" width="50%" />

    ## 
    ## 
    ## [[2]]
    ## [[2]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/six_topics-4.png" width="50%" />

    ## 
    ## [[2]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/six_topics-5.png" width="50%" />

    ## 
    ## [[2]]$learn

<img src="explore_clusters_w1_files/figure-gfm/six_topics-6.png" width="50%" />

    ## 
    ## 
    ## [[3]]
    ## [[3]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/six_topics-7.png" width="50%" />

    ## 
    ## [[3]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/six_topics-8.png" width="50%" />

    ## 
    ## [[3]]$learn

<img src="explore_clusters_w1_files/figure-gfm/six_topics-9.png" width="50%" />

    ## 
    ## 
    ## [[4]]
    ## [[4]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/six_topics-10.png" width="50%" />

    ## 
    ## [[4]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/six_topics-11.png" width="50%" />

    ## 
    ## [[4]]$learn

<img src="explore_clusters_w1_files/figure-gfm/six_topics-12.png" width="50%" />

    ## 
    ## 
    ## [[5]]
    ## [[5]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/six_topics-13.png" width="50%" />

    ## 
    ## [[5]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/six_topics-14.png" width="50%" />

    ## 
    ## [[5]]$learn

<img src="explore_clusters_w1_files/figure-gfm/six_topics-15.png" width="50%" />

    ## 
    ## 
    ## [[6]]
    ## [[6]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/six_topics-16.png" width="50%" />

    ## 
    ## [[6]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/six_topics-17.png" width="50%" />

    ## 
    ## [[6]]$learn

<img src="explore_clusters_w1_files/figure-gfm/six_topics-18.png" width="50%" />

### 7 cluster solution

``` r
rank_topics(needs_assessment_long, cluster = group7, n_cluster = 7)
```

    ## [[1]]
    ## [[1]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-1.png" width="50%" />

    ## 
    ## [[1]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-2.png" width="50%" />

    ## 
    ## [[1]]$learn

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-3.png" width="50%" />

    ## 
    ## 
    ## [[2]]
    ## [[2]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-4.png" width="50%" />

    ## 
    ## [[2]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-5.png" width="50%" />

    ## 
    ## [[2]]$learn

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-6.png" width="50%" />

    ## 
    ## 
    ## [[3]]
    ## [[3]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-7.png" width="50%" />

    ## 
    ## [[3]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-8.png" width="50%" />

    ## 
    ## [[3]]$learn

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-9.png" width="50%" />

    ## 
    ## 
    ## [[4]]
    ## [[4]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-10.png" width="50%" />

    ## 
    ## [[4]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-11.png" width="50%" />

    ## 
    ## [[4]]$learn

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-12.png" width="50%" />

    ## 
    ## 
    ## [[5]]
    ## [[5]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-13.png" width="50%" />

    ## 
    ## [[5]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-14.png" width="50%" />

    ## 
    ## [[5]]$learn

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-15.png" width="50%" />

    ## 
    ## 
    ## [[6]]
    ## [[6]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-16.png" width="50%" />

    ## 
    ## [[6]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-17.png" width="50%" />

    ## 
    ## [[6]]$learn

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-18.png" width="50%" />

    ## 
    ## 
    ## [[7]]
    ## [[7]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-19.png" width="50%" />

    ## 
    ## [[7]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-20.png" width="50%" />

    ## 
    ## [[7]]$learn

<img src="explore_clusters_w1_files/figure-gfm/seven_topics-21.png" width="50%" />

### 8 cluster solution

``` r
rank_topics(needs_assessment_long, cluster = group8, n_cluster = 8)
```

    ## [[1]]
    ## [[1]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-1.png" width="50%" />

    ## 
    ## [[1]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-2.png" width="50%" />

    ## 
    ## [[1]]$learn

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-3.png" width="50%" />

    ## 
    ## 
    ## [[2]]
    ## [[2]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-4.png" width="50%" />

    ## 
    ## [[2]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-5.png" width="50%" />

    ## 
    ## [[2]]$learn

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-6.png" width="50%" />

    ## 
    ## 
    ## [[3]]
    ## [[3]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-7.png" width="50%" />

    ## 
    ## [[3]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-8.png" width="50%" />

    ## 
    ## [[3]]$learn

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-9.png" width="50%" />

    ## 
    ## 
    ## [[4]]
    ## [[4]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-10.png" width="50%" />

    ## 
    ## [[4]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-11.png" width="50%" />

    ## 
    ## [[4]]$learn

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-12.png" width="50%" />

    ## 
    ## 
    ## [[5]]
    ## [[5]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-13.png" width="50%" />

    ## 
    ## [[5]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-14.png" width="50%" />

    ## 
    ## [[5]]$learn

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-15.png" width="50%" />

    ## 
    ## 
    ## [[6]]
    ## [[6]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-16.png" width="50%" />

    ## 
    ## [[6]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-17.png" width="50%" />

    ## 
    ## [[6]]$learn

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-18.png" width="50%" />

    ## 
    ## 
    ## [[7]]
    ## [[7]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-19.png" width="50%" />

    ## 
    ## [[7]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-20.png" width="50%" />

    ## 
    ## [[7]]$learn

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-21.png" width="50%" />

    ## 
    ## 
    ## [[8]]
    ## [[8]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-22.png" width="50%" />

    ## 
    ## [[8]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-23.png" width="50%" />

    ## 
    ## [[8]]$learn

<img src="explore_clusters_w1_files/figure-gfm/eight_topics-24.png" width="50%" />

### 9 cluster solution

``` r
rank_topics(needs_assessment_long, cluster = group9, n_cluster = 9)
```

    ## [[1]]
    ## [[1]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-1.png" width="50%" />

    ## 
    ## [[1]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-2.png" width="50%" />

    ## 
    ## [[1]]$learn

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-3.png" width="50%" />

    ## 
    ## 
    ## [[2]]
    ## [[2]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-4.png" width="50%" />

    ## 
    ## [[2]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-5.png" width="50%" />

    ## 
    ## [[2]]$learn

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-6.png" width="50%" />

    ## 
    ## 
    ## [[3]]
    ## [[3]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-7.png" width="50%" />

    ## 
    ## [[3]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-8.png" width="50%" />

    ## 
    ## [[3]]$learn

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-9.png" width="50%" />

    ## 
    ## 
    ## [[4]]
    ## [[4]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-10.png" width="50%" />

    ## 
    ## [[4]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-11.png" width="50%" />

    ## 
    ## [[4]]$learn

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-12.png" width="50%" />

    ## 
    ## 
    ## [[5]]
    ## [[5]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-13.png" width="50%" />

    ## 
    ## [[5]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-14.png" width="50%" />

    ## 
    ## [[5]]$learn

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-15.png" width="50%" />

    ## 
    ## 
    ## [[6]]
    ## [[6]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-16.png" width="50%" />

    ## 
    ## [[6]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-17.png" width="50%" />

    ## 
    ## [[6]]$learn

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-18.png" width="50%" />

    ## 
    ## 
    ## [[7]]
    ## [[7]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-19.png" width="50%" />

    ## 
    ## [[7]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-20.png" width="50%" />

    ## 
    ## [[7]]$learn

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-21.png" width="50%" />

    ## 
    ## 
    ## [[8]]
    ## [[8]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-22.png" width="50%" />

    ## 
    ## [[8]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-23.png" width="50%" />

    ## 
    ## [[8]]$learn

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-24.png" width="50%" />

    ## 
    ## 
    ## [[9]]
    ## [[9]]$expertise

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-25.png" width="50%" />

    ## 
    ## [[9]]$relevance

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-26.png" width="50%" />

    ## 
    ## [[9]]$learn

<img src="explore_clusters_w1_files/figure-gfm/nine_topics-27.png" width="50%" />
