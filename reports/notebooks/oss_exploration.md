Open Scholarship Survey Exploration
================
Rose Hartman
2023-12-11

## Some notes about this report

This report pools Wave 1 and Wave 2 data, since the OSS forms were
identical across both. It also uses as much data as is available for
each comparison, rather than defining a consistent dataset that would be
used throughout the report.

So, for example, if a participant filled out the pretest but not
posttest OSS forms, that participant’s data would show up in the means
calculated for pretest and in histograms, etc. showing pretest data, but
they would be excluded from the paired pre/post t-tests and the line
plots showing change from pre to post. Items on these forms were not
marked as required, so there are also more complex patterns of
missingness possible (such as a participant responding to the attitude
question but leaving the behavior norms question blank); again, data are
presented whenever we have them. So the N’s jump around test to test and
plot to plot.

> Note that code chunks are not printed in this report in order to keep
> the output tidy. To see all of the code to generate these results,
> open the .Rmd file.

## Exploration of changes pre to post

    ## # A tibble: 3 × 3
    ##   name            pre  post
    ##   <chr>         <dbl> <dbl>
    ## 1 attitude       4.36  4.45
    ## 2 behavior_norm 27.1  28.2 
    ## 3 frequency      7.34 11.7

    ## # A tibble: 3 × 3
    ##   name            pre  post
    ##   <chr>         <dbl> <dbl>
    ## 1 attitude       4.35  4.43
    ## 2 behavior_norm 32.9  32.4 
    ## 3 frequency     12.7  15.4

    ## $attitude
    ## 
    ##  Paired t-test
    ## 
    ## data:  this_df$post and this_df$pre
    ## t = 1.3646, df = 269, p-value = 0.1735
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.03772076  0.20809113
    ## sample estimates:
    ## mean of the differences 
    ##              0.08518519 
    ## 
    ## 
    ## $frequency
    ## 
    ##  Paired t-test
    ## 
    ## data:  this_df$post and this_df$pre
    ## t = 2.7326, df = 246, p-value = 0.00674
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  1.154094 7.113113
    ## sample estimates:
    ## mean of the differences 
    ##                4.133603 
    ## 
    ## 
    ## $behavior_norm
    ## 
    ##  Paired t-test
    ## 
    ## data:  this_df$post and this_df$pre
    ## t = 1.2864, df = 234, p-value = 0.1996
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -1.015496  4.836772
    ## sample estimates:
    ## mean of the differences 
    ##                1.910638

    ## $attitude
    ## 
    ##  Paired t-test
    ## 
    ## data:  this_df$post and this_df$pre
    ## t = 1.3606, df = 260, p-value = 0.1748
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.03598656  0.19690610
    ## sample estimates:
    ## mean of the differences 
    ##              0.08045977 
    ## 
    ## 
    ## $frequency
    ## 
    ##  Paired t-test
    ## 
    ## data:  this_df$post and this_df$pre
    ## t = 1.6736, df = 247, p-value = 0.09548
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.4714359  5.8020811
    ## sample estimates:
    ## mean of the differences 
    ##                2.665323 
    ## 
    ## 
    ## $behavior_norm
    ## 
    ##  Paired t-test
    ## 
    ## data:  this_df$post and this_df$pre
    ## t = 0.26378, df = 240, p-value = 0.7922
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -2.952244  3.865107
    ## sample estimates:
    ## mean of the differences 
    ##               0.4564315

    ## Warning: Removed 102 rows containing non-finite values (stat_bin).

    ## Warning: Removed 102 rows containing non-finite values (stat_boxplot).

    ## Warning: Removed 102 rows containing missing values (geom_point).

    ## Warning: Removed 55 row(s) containing missing values (geom_path).

![](../figures/oss_data_sharing_hist.png)

![](../figures/oss_data_sharing_box.png)

![](../figures/oss_data_sharing_line.png)

    ## Warning: Removed 114 rows containing non-finite values (stat_bin).

    ## Warning: Removed 114 rows containing non-finite values (stat_boxplot).

    ## Warning: Removed 114 rows containing missing values (geom_point).

    ## Warning: Removed 53 row(s) containing missing values (geom_path).

![](../figures/oss_code_sharing_hist.png)

![](../figures/oss_code_sharing_box.png)

![](../figures/oss_code_sharing_line.png)
