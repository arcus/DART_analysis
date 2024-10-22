Explore clusters
================
Rose Hartman
22 October, 2024

``` r
needs_assessment_long <- readRDS(here::here("data", "deidentified", "needs_assessment_with_clusters_w2.rds")) |> 
  # reformat to long
  tidyr::pivot_longer(cols = dplyr::matches("_relevance|_expertise|_learn")) |> 
  # separate topic (e.g. data_viz) from question type (relevance, expertise, or learn)
  tidyr::extract(name, into = c("topic", "question"), regex = "(.*)_([[:lower:]]+)", remove = TRUE) |> 
  dplyr::mutate(question = factor(question, levels = c("relevance", "expertise", "learn")),
                topic = as.factor(topic))
```

# Solution with 19 clusters

## distributions by cluster

``` r
plot_by_theme(needs_assessment_long, cluster=(!!sym(params$cluster)))
```

## Which topics are most important to each cluster?

for each cluster, rank topics by desire to learn, expertise, or
relevance

``` r
rank_topics(needs_assessment_long, cluster = (!!sym(params$cluster)), n_cluster = params$n_cluster)
```

    ## [[1]]
    ## [[1]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-1.png" width="50%" />

    ## 
    ## [[1]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-2.png" width="50%" />

    ## 
    ## [[1]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-3.png" width="50%" />

    ## 
    ## 
    ## [[2]]
    ## [[2]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-4.png" width="50%" />

    ## 
    ## [[2]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-5.png" width="50%" />

    ## 
    ## [[2]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-6.png" width="50%" />

    ## 
    ## 
    ## [[3]]
    ## [[3]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-7.png" width="50%" />

    ## 
    ## [[3]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-8.png" width="50%" />

    ## 
    ## [[3]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-9.png" width="50%" />

    ## 
    ## 
    ## [[4]]
    ## [[4]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-10.png" width="50%" />

    ## 
    ## [[4]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-11.png" width="50%" />

    ## 
    ## [[4]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-12.png" width="50%" />

    ## 
    ## 
    ## [[5]]
    ## [[5]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-13.png" width="50%" />

    ## 
    ## [[5]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-14.png" width="50%" />

    ## 
    ## [[5]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-15.png" width="50%" />

    ## 
    ## 
    ## [[6]]
    ## [[6]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-16.png" width="50%" />

    ## 
    ## [[6]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-17.png" width="50%" />

    ## 
    ## [[6]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-18.png" width="50%" />

    ## 
    ## 
    ## [[7]]
    ## [[7]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-19.png" width="50%" />

    ## 
    ## [[7]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-20.png" width="50%" />

    ## 
    ## [[7]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-21.png" width="50%" />

    ## 
    ## 
    ## [[8]]
    ## [[8]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-22.png" width="50%" />

    ## 
    ## [[8]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-23.png" width="50%" />

    ## 
    ## [[8]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-24.png" width="50%" />

    ## 
    ## 
    ## [[9]]
    ## [[9]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-25.png" width="50%" />

    ## 
    ## [[9]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-26.png" width="50%" />

    ## 
    ## [[9]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-27.png" width="50%" />

    ## 
    ## 
    ## [[10]]
    ## [[10]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-28.png" width="50%" />

    ## 
    ## [[10]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-29.png" width="50%" />

    ## 
    ## [[10]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-30.png" width="50%" />

    ## 
    ## 
    ## [[11]]
    ## [[11]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-31.png" width="50%" />

    ## 
    ## [[11]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-32.png" width="50%" />

    ## 
    ## [[11]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-33.png" width="50%" />

    ## 
    ## 
    ## [[12]]
    ## [[12]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-34.png" width="50%" />

    ## 
    ## [[12]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-35.png" width="50%" />

    ## 
    ## [[12]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-36.png" width="50%" />

    ## 
    ## 
    ## [[13]]
    ## [[13]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-37.png" width="50%" />

    ## 
    ## [[13]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-38.png" width="50%" />

    ## 
    ## [[13]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-39.png" width="50%" />

    ## 
    ## 
    ## [[14]]
    ## [[14]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-40.png" width="50%" />

    ## 
    ## [[14]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-41.png" width="50%" />

    ## 
    ## [[14]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-42.png" width="50%" />

    ## 
    ## 
    ## [[15]]
    ## [[15]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-43.png" width="50%" />

    ## 
    ## [[15]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-44.png" width="50%" />

    ## 
    ## [[15]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-45.png" width="50%" />

    ## 
    ## 
    ## [[16]]
    ## [[16]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-46.png" width="50%" />

    ## 
    ## [[16]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-47.png" width="50%" />

    ## 
    ## [[16]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-48.png" width="50%" />

    ## 
    ## 
    ## [[17]]
    ## [[17]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-49.png" width="50%" />

    ## 
    ## [[17]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-50.png" width="50%" />

    ## 
    ## [[17]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-51.png" width="50%" />

    ## 
    ## 
    ## [[18]]
    ## [[18]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-52.png" width="50%" />

    ## 
    ## [[18]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-53.png" width="50%" />

    ## 
    ## [[18]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-54.png" width="50%" />

    ## 
    ## 
    ## [[19]]
    ## [[19]]$expertise

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-55.png" width="50%" />

    ## 
    ## [[19]]$relevance

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-56.png" width="50%" />

    ## 
    ## [[19]]$learn

<img src="explore_clusters_w2_files/figure-gfm/rank_topics-57.png" width="50%" />
