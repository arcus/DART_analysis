Attrition analysis
================
Rose Hartman
2025-03-05

> Note that code chunks are not printed in this report in order to keep
> the output tidy. To see all of the code to generate these results,
> open the .Rmd file.

Comment from reviewer 2:

> My concern about the methodology and discussion of results is that the
> authors do not discuss the fact that a significant number of
> participants in both waves, nearly half, didn’t complete both the pre
> and post test. This may introduce bias into the results, in a similar
> way to when patients are lost to follow up in a clinical trial. We
> can’t know for sure anything about the experience of the people who
> didn’t respond to the post test. Did they find the training useful but
> just not get around to the post test, or did they stop participating
> because they didn’t see value in the training? It seems reasonable to
> expect that the participants who did take the time to complete the
> post test may be different from those who did not in how useful they
> found the training, and this potential bias should at the very least
> be addressed in the discussion of limitations.

## How many participants completed each assessment phase for each wave?

<img src="../tables/screened_participant_n_by_phase.png" width="50%" />

## Look for differences for participants who dropped out

### Needs assessment differences for analyzed vs not?

<img src="../figures/attrition_needsassessment.tiff" width="50%" />

    ##           Df   Pillai approx F num Df den Df Pr(>F)
    ## analyzed   1 0.055747   1.8302      3     93 0.1471
    ## Residuals 95

    ##  Response relevance :
    ##             Df  Sum Sq Mean Sq F value Pr(>F)
    ## analyzed     1  0.3575 0.35754  1.8895 0.1725
    ## Residuals   95 17.9763 0.18922               
    ## 
    ##  Response expertise :
    ##             Df Sum Sq  Mean Sq F value Pr(>F)
    ## analyzed     1 0.2402 0.240226  2.4981 0.1173
    ## Residuals   95 9.1356 0.096165               
    ## 
    ##  Response learn :
    ##             Df  Sum Sq Mean Sq F value  Pr(>F)  
    ## analyzed     1  0.8177 0.81774  4.7615 0.03157 *
    ## Residuals   95 16.3154 0.17174                  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    ##            Df    Pillai approx F num Df den Df Pr(>F)
    ## analyzed    1 0.0021252  0.29462      3    415 0.8293
    ## Residuals 417

    ##  Response relevance :
    ##              Df Sum Sq  Mean Sq F value Pr(>F)
    ## analyzed      1  0.013 0.012902  0.0604  0.806
    ## Residuals   417 89.074 0.213606               
    ## 
    ##  Response expertise :
    ##              Df Sum Sq  Mean Sq F value Pr(>F)
    ## analyzed      1  0.000 0.000018   1e-04  0.991
    ## Residuals   417 59.277 0.142152               
    ## 
    ##  Response learn :
    ##              Df Sum Sq Mean Sq F value Pr(>F)
    ## analyzed      1  0.104 0.10412  0.4854 0.4864
    ## Residuals   417 89.440 0.21449

### Pretest differences for analyzed vs not?

    ## 
    ## Call:
    ## glm(formula = analyzed ~ ability_pre * openscience_pre, family = "binomial", 
    ##     data = dplyr::filter(nih_pre_and_attrition, nih_pre == 1 & 
    ##         wave == "Wave 1"))
    ## 
    ## Coefficients:
    ##                             Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)                  -8.2725    11.0485  -0.749    0.454
    ## ability_pre                   4.0311     5.1690   0.780    0.435
    ## openscience_pre               1.2000     1.7484   0.686    0.493
    ## ability_pre:openscience_pre  -0.5753     0.8144  -0.706    0.480
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 127.37  on 91  degrees of freedom
    ## Residual deviance: 125.73  on 88  degrees of freedom
    ## AIC: 133.73
    ## 
    ## Number of Fisher Scoring iterations: 4

    ## 
    ## Call:
    ## glm(formula = analyzed ~ ability_pre * openscience_pre, family = "binomial", 
    ##     data = dplyr::filter(nih_pre_and_attrition, nih_pre == 1 & 
    ##         wave == "Wave 2"))
    ## 
    ## Coefficients:
    ##                             Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)                  -4.1944     4.1737  -1.005    0.315
    ## ability_pre                   2.8013     1.8353   1.526    0.127
    ## openscience_pre               0.7211     0.6614   1.090    0.276
    ## ability_pre:openscience_pre  -0.4415     0.2879  -1.534    0.125
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 541.03  on 400  degrees of freedom
    ## Residual deviance: 536.93  on 397  degrees of freedom
    ## AIC: 544.93
    ## 
    ## Number of Fisher Scoring iterations: 4

    ##           Df   Pillai approx F num Df den Df Pr(>F)
    ## analyzed   1 0.012227  0.55084      2     89 0.5784
    ## Residuals 90

    ##  Response ability_pre :
    ##             Df  Sum Sq Mean Sq F value Pr(>F)
    ## analyzed     1  0.3621 0.36206  1.1141  0.294
    ## Residuals   90 29.2492 0.32499               
    ## 
    ##  Response openscience_pre :
    ##             Df  Sum Sq  Mean Sq F value Pr(>F)
    ## analyzed     1  0.0013 0.001264  0.0049 0.9445
    ## Residuals   90 23.3486 0.259428

    ##            Df    Pillai approx F num Df den Df Pr(>F)
    ## analyzed    1 0.0042848  0.85634      2    398 0.4255
    ## Residuals 399

    ##  Response ability_pre :
    ##              Df  Sum Sq Mean Sq F value Pr(>F)
    ## analyzed      1   0.025  0.0248  0.0587 0.8087
    ## Residuals   399 168.617  0.4226               
    ## 
    ##  Response openscience_pre :
    ##              Df  Sum Sq Mean Sq F value Pr(>F)
    ## analyzed      1   0.488 0.48820  1.7169 0.1908
    ## Residuals   399 113.454 0.28435

### combined data

    ## Warning for variable 'relevance':
    ## simpleWarning in wilcox.test.default(x = DATA[[1L]], y = DATA[[2L]], ...): cannot compute exact p-value with ties

    ## Warning for variable 'expertise':
    ## simpleWarning in wilcox.test.default(x = DATA[[1L]], y = DATA[[2L]], ...): cannot compute exact p-value with ties

    ## Warning for variable 'learn':
    ## simpleWarning in wilcox.test.default(x = DATA[[1L]], y = DATA[[2L]], ...): cannot compute exact p-value with ties

    ## Warning for variable 'ability_pre':
    ## simpleWarning in wilcox.test.default(x = DATA[[1L]], y = DATA[[2L]], ...): cannot compute exact p-value with ties

    ## Warning for variable 'openscience_pre':
    ## simpleWarning in wilcox.test.default(x = DATA[[1L]], y = DATA[[2L]], ...): cannot compute exact p-value with ties

<div id="hmdnbebxss" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#hmdnbebxss table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#hmdnbebxss thead, #hmdnbebxss tbody, #hmdnbebxss tfoot, #hmdnbebxss tr, #hmdnbebxss td, #hmdnbebxss th {
  border-style: none;
}
&#10;#hmdnbebxss p {
  margin: 0;
  padding: 0;
}
&#10;#hmdnbebxss .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#hmdnbebxss .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#hmdnbebxss .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#hmdnbebxss .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#hmdnbebxss .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#hmdnbebxss .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#hmdnbebxss .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#hmdnbebxss .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#hmdnbebxss .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#hmdnbebxss .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#hmdnbebxss .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#hmdnbebxss .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#hmdnbebxss .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#hmdnbebxss .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#hmdnbebxss .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hmdnbebxss .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#hmdnbebxss .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#hmdnbebxss .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#hmdnbebxss .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hmdnbebxss .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#hmdnbebxss .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hmdnbebxss .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#hmdnbebxss .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hmdnbebxss .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#hmdnbebxss .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hmdnbebxss .gt_left {
  text-align: left;
}
&#10;#hmdnbebxss .gt_center {
  text-align: center;
}
&#10;#hmdnbebxss .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#hmdnbebxss .gt_font_normal {
  font-weight: normal;
}
&#10;#hmdnbebxss .gt_font_bold {
  font-weight: bold;
}
&#10;#hmdnbebxss .gt_font_italic {
  font-style: italic;
}
&#10;#hmdnbebxss .gt_super {
  font-size: 65%;
}
&#10;#hmdnbebxss .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#hmdnbebxss .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#hmdnbebxss .gt_indent_1 {
  text-indent: 5px;
}
&#10;#hmdnbebxss .gt_indent_2 {
  text-indent: 10px;
}
&#10;#hmdnbebxss .gt_indent_3 {
  text-indent: 15px;
}
&#10;#hmdnbebxss .gt_indent_4 {
  text-indent: 20px;
}
&#10;#hmdnbebxss .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Not Analyzed&lt;/strong&gt;, N = 49&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>Not Analyzed</strong>, N = 49<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Analyzed&lt;/strong&gt;, N = 48&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>Analyzed</strong>, N = 48<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;p-value&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;2&lt;/sup&gt;&lt;/span&gt;"><strong>p-value</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>2</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="Needs Assessment">Needs Assessment</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Needs Assessment  label" class="gt_row gt_left">Relevance</td>
<td headers="Needs Assessment  stat_1" class="gt_row gt_center">2.29 (2.04, 2.54)</td>
<td headers="Needs Assessment  stat_2" class="gt_row gt_center">2.34 (2.11, 2.79)</td>
<td headers="Needs Assessment  p.value" class="gt_row gt_center">0.271</td></tr>
    <tr><td headers="Needs Assessment  label" class="gt_row gt_left">Expertise</td>
<td headers="Needs Assessment  stat_1" class="gt_row gt_center">1.29 (1.14, 1.54)</td>
<td headers="Needs Assessment  stat_2" class="gt_row gt_center">1.46 (1.24, 1.65)</td>
<td headers="Needs Assessment  p.value" class="gt_row gt_center">0.051</td></tr>
    <tr><td headers="Needs Assessment  label" class="gt_row gt_left">Interest in Learning</td>
<td headers="Needs Assessment  stat_1" class="gt_row gt_center">2.64 (2.36, 2.96)</td>
<td headers="Needs Assessment  stat_2" class="gt_row gt_center">2.88 (2.54, 3.14)</td>
<td headers="Needs Assessment  p.value" class="gt_row gt_center">0.086</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="Pretest">Pretest</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Pretest  label" class="gt_row gt_left">Data Science Ability</td>
<td headers="Pretest  stat_1" class="gt_row gt_center">1.93 (1.48, 2.39)</td>
<td headers="Pretest  stat_2" class="gt_row gt_center">2.00 (1.68, 2.46)</td>
<td headers="Pretest  p.value" class="gt_row gt_center">0.252</td></tr>
    <tr><td headers="Pretest  label" class="gt_row gt_left">Open Science Values</td>
<td headers="Pretest  stat_1" class="gt_row gt_center">6.20 (5.95, 6.70)</td>
<td headers="Pretest  stat_2" class="gt_row gt_center">6.28 (5.89, 6.70)</td>
<td headers="Pretest  p.value" class="gt_row gt_center">0.941</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR)</td>
    </tr>
    <tr>
      <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>2</sup></span> Wilcoxon rank sum test</td>
    </tr>
  </tfoot>
</table>
</div>
<div id="otaetkzyig" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#otaetkzyig table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#otaetkzyig thead, #otaetkzyig tbody, #otaetkzyig tfoot, #otaetkzyig tr, #otaetkzyig td, #otaetkzyig th {
  border-style: none;
}
&#10;#otaetkzyig p {
  margin: 0;
  padding: 0;
}
&#10;#otaetkzyig .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#otaetkzyig .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#otaetkzyig .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#otaetkzyig .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#otaetkzyig .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#otaetkzyig .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#otaetkzyig .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#otaetkzyig .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#otaetkzyig .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#otaetkzyig .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#otaetkzyig .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#otaetkzyig .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#otaetkzyig .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#otaetkzyig .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#otaetkzyig .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#otaetkzyig .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#otaetkzyig .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#otaetkzyig .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#otaetkzyig .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#otaetkzyig .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#otaetkzyig .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#otaetkzyig .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#otaetkzyig .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#otaetkzyig .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#otaetkzyig .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#otaetkzyig .gt_left {
  text-align: left;
}
&#10;#otaetkzyig .gt_center {
  text-align: center;
}
&#10;#otaetkzyig .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#otaetkzyig .gt_font_normal {
  font-weight: normal;
}
&#10;#otaetkzyig .gt_font_bold {
  font-weight: bold;
}
&#10;#otaetkzyig .gt_font_italic {
  font-style: italic;
}
&#10;#otaetkzyig .gt_super {
  font-size: 65%;
}
&#10;#otaetkzyig .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#otaetkzyig .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#otaetkzyig .gt_indent_1 {
  text-indent: 5px;
}
&#10;#otaetkzyig .gt_indent_2 {
  text-indent: 10px;
}
&#10;#otaetkzyig .gt_indent_3 {
  text-indent: 15px;
}
&#10;#otaetkzyig .gt_indent_4 {
  text-indent: 20px;
}
&#10;#otaetkzyig .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Not Analyzed&lt;/strong&gt;, N = 180&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>Not Analyzed</strong>, N = 180<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Analyzed&lt;/strong&gt;, N = 239&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>Analyzed</strong>, N = 239<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;p-value&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;2&lt;/sup&gt;&lt;/span&gt;"><strong>p-value</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>2</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="Needs Assessment">Needs Assessment</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Needs Assessment  label" class="gt_row gt_left">Relevance</td>
<td headers="Needs Assessment  stat_1" class="gt_row gt_center">2.68 (2.29, 3.04)</td>
<td headers="Needs Assessment  stat_2" class="gt_row gt_center">2.64 (2.36, 2.93)</td>
<td headers="Needs Assessment  p.value" class="gt_row gt_center">0.713</td></tr>
    <tr><td headers="Needs Assessment  label" class="gt_row gt_left">Expertise</td>
<td headers="Needs Assessment  stat_1" class="gt_row gt_center">1.64 (1.36, 1.93)</td>
<td headers="Needs Assessment  stat_2" class="gt_row gt_center">1.68 (1.43, 1.93)</td>
<td headers="Needs Assessment  p.value" class="gt_row gt_center">0.677</td></tr>
    <tr><td headers="Needs Assessment  label" class="gt_row gt_left">Interest in Learning</td>
<td headers="Needs Assessment  stat_1" class="gt_row gt_center">2.89 (2.57, 3.25)</td>
<td headers="Needs Assessment  stat_2" class="gt_row gt_center">2.89 (2.61, 3.23)</td>
<td headers="Needs Assessment  p.value" class="gt_row gt_center">0.794</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="Pretest">Pretest</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Pretest  label" class="gt_row gt_left">Data Science Ability</td>
<td headers="Pretest  stat_1" class="gt_row gt_center">2.37 (1.84, 2.84)</td>
<td headers="Pretest  stat_2" class="gt_row gt_center">2.31 (1.88, 2.74)</td>
<td headers="Pretest  p.value" class="gt_row gt_center">0.805</td></tr>
    <tr><td headers="Pretest  label" class="gt_row gt_left">Open Science Values</td>
<td headers="Pretest  stat_1" class="gt_row gt_center">6.30 (5.91, 6.75)</td>
<td headers="Pretest  stat_2" class="gt_row gt_center">6.15 (5.85, 6.60)</td>
<td headers="Pretest  p.value" class="gt_row gt_center">0.090</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR)</td>
    </tr>
    <tr>
      <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>2</sup></span> Wilcoxon rank sum test</td>
    </tr>
  </tfoot>
</table>
</div>

## NALMS activity by attrition

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

<img src="attrition_analysis_files/figure-gfm/unnamed-chunk-4-1.png" width="50%" />

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

<img src="attrition_analysis_files/figure-gfm/unnamed-chunk-4-2.png" width="50%" />

    ## Call: xtabs(formula = ~past_day_1 + analyzed, data = nalms_and_attrition)
    ## Number of cases in table: 419 
    ## Number of factors: 2 
    ## Test for independence of all factors:
    ##  Chisq = 39.4, df = 1, p-value = 3.456e-10

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  engagement by analyzed
    ## W = 11488, p-value < 2.2e-16
    ## alternative hypothesis: true location shift is not equal to 0

### Do learners with 0 engagement in NALMS differ at post?

<div id="coozeymgxw" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#coozeymgxw table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#coozeymgxw thead, #coozeymgxw tbody, #coozeymgxw tfoot, #coozeymgxw tr, #coozeymgxw td, #coozeymgxw th {
  border-style: none;
}
&#10;#coozeymgxw p {
  margin: 0;
  padding: 0;
}
&#10;#coozeymgxw .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#coozeymgxw .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#coozeymgxw .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#coozeymgxw .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#coozeymgxw .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#coozeymgxw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#coozeymgxw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#coozeymgxw .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#coozeymgxw .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#coozeymgxw .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#coozeymgxw .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#coozeymgxw .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#coozeymgxw .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#coozeymgxw .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#coozeymgxw .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#coozeymgxw .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#coozeymgxw .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#coozeymgxw .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#coozeymgxw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#coozeymgxw .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#coozeymgxw .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#coozeymgxw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#coozeymgxw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#coozeymgxw .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#coozeymgxw .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#coozeymgxw .gt_left {
  text-align: left;
}
&#10;#coozeymgxw .gt_center {
  text-align: center;
}
&#10;#coozeymgxw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#coozeymgxw .gt_font_normal {
  font-weight: normal;
}
&#10;#coozeymgxw .gt_font_bold {
  font-weight: bold;
}
&#10;#coozeymgxw .gt_font_italic {
  font-style: italic;
}
&#10;#coozeymgxw .gt_super {
  font-size: 65%;
}
&#10;#coozeymgxw .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#coozeymgxw .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#coozeymgxw .gt_indent_1 {
  text-indent: 5px;
}
&#10;#coozeymgxw .gt_indent_2 {
  text-indent: 10px;
}
&#10;#coozeymgxw .gt_indent_3 {
  text-indent: 15px;
}
&#10;#coozeymgxw .gt_indent_4 {
  text-indent: 20px;
}
&#10;#coozeymgxw .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;No Activity after Day 1&lt;/strong&gt;, N = 69&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>No Activity after Day 1</strong>, N = 69<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Active after Day 1&lt;/strong&gt;, N = 170&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>Active after Day 1</strong>, N = 170<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;p-value&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;2&lt;/sup&gt;&lt;/span&gt;"><strong>p-value</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>2</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="Needs Assessment">Needs Assessment</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Needs Assessment  label" class="gt_row gt_left">Relevance</td>
<td headers="Needs Assessment  stat_1" class="gt_row gt_center">2.61 (2.36, 3.00)</td>
<td headers="Needs Assessment  stat_2" class="gt_row gt_center">2.64 (2.36, 2.92)</td>
<td headers="Needs Assessment  p.value" class="gt_row gt_center">0.782</td></tr>
    <tr><td headers="Needs Assessment  label" class="gt_row gt_left">Interest in Learning</td>
<td headers="Needs Assessment  stat_1" class="gt_row gt_center">2.96 (2.61, 3.21)</td>
<td headers="Needs Assessment  stat_2" class="gt_row gt_center">2.88 (2.61, 3.24)</td>
<td headers="Needs Assessment  p.value" class="gt_row gt_center">0.934</td></tr>
    <tr><td headers="Needs Assessment  label" class="gt_row gt_left">Expertise</td>
<td headers="Needs Assessment  stat_1" class="gt_row gt_center">1.61 (1.43, 1.86)</td>
<td headers="Needs Assessment  stat_2" class="gt_row gt_center">1.68 (1.43, 1.93)</td>
<td headers="Needs Assessment  p.value" class="gt_row gt_center">0.463</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="Pretest">Pretest</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Pretest  label" class="gt_row gt_left">Data Science Ability (pre)</td>
<td headers="Pretest  stat_1" class="gt_row gt_center">2.26 (1.80, 2.77)</td>
<td headers="Pretest  stat_2" class="gt_row gt_center">2.34 (1.94, 2.71)</td>
<td headers="Pretest  p.value" class="gt_row gt_center">0.519</td></tr>
    <tr><td headers="Pretest  label" class="gt_row gt_left">Open Science Values (pre)</td>
<td headers="Pretest  stat_1" class="gt_row gt_center">6.30 (5.95, 6.60)</td>
<td headers="Pretest  stat_2" class="gt_row gt_center">6.15 (5.85, 6.60)</td>
<td headers="Pretest  p.value" class="gt_row gt_center">0.197</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="Posttest">Posttest</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Posttest  label" class="gt_row gt_left">Data Science Ability (post)</td>
<td headers="Posttest  stat_1" class="gt_row gt_center">2.91 (2.00, 3.37)</td>
<td headers="Posttest  stat_2" class="gt_row gt_center">3.13 (2.77, 3.45)</td>
<td headers="Posttest  p.value" class="gt_row gt_center">0.009</td></tr>
    <tr><td headers="Posttest  label" class="gt_row gt_left">Open Science Values (post)</td>
<td headers="Posttest  stat_1" class="gt_row gt_center">6.35 (6.00, 6.80)</td>
<td headers="Posttest  stat_2" class="gt_row gt_center">6.63 (6.15, 6.85)</td>
<td headers="Posttest  p.value" class="gt_row gt_center">0.181</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="Exit Survey">Exit Survey</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Exit Survey  label" class="gt_row gt_left">met_expectations</td>
<td headers="Exit Survey  stat_1" class="gt_row gt_center">3.00 (3.00, 4.00)</td>
<td headers="Exit Survey  stat_2" class="gt_row gt_center">4.00 (4.00, 5.00)</td>
<td headers="Exit Survey  p.value" class="gt_row gt_center"><0.001</td></tr>
    <tr><td headers="Exit Survey  label" class="gt_row gt_left">fit_learn</td>
<td headers="Exit Survey  stat_1" class="gt_row gt_center">4.00 (3.00, 4.00)</td>
<td headers="Exit Survey  stat_2" class="gt_row gt_center">4.00 (4.00, 5.00)</td>
<td headers="Exit Survey  p.value" class="gt_row gt_center">0.009</td></tr>
    <tr><td headers="Exit Survey  label" class="gt_row gt_left">fit_relevance</td>
<td headers="Exit Survey  stat_1" class="gt_row gt_center">3.00 (3.00, 4.00)</td>
<td headers="Exit Survey  stat_2" class="gt_row gt_center">4.00 (4.00, 5.00)</td>
<td headers="Exit Survey  p.value" class="gt_row gt_center"><0.001</td></tr>
    <tr><td headers="Exit Survey  label" class="gt_row gt_left">fit_expertise</td>
<td headers="Exit Survey  stat_1" class="gt_row gt_center">3.00 (3.00, 4.00)</td>
<td headers="Exit Survey  stat_2" class="gt_row gt_center">4.00 (4.00, 4.75)</td>
<td headers="Exit Survey  p.value" class="gt_row gt_center"><0.001</td></tr>
    <tr><td headers="Exit Survey  label" class="gt_row gt_left">coherent_pathway</td>
<td headers="Exit Survey  stat_1" class="gt_row gt_center">3.00 (3.00, 4.00)</td>
<td headers="Exit Survey  stat_2" class="gt_row gt_center">4.00 (4.00, 4.75)</td>
<td headers="Exit Survey  p.value" class="gt_row gt_center"><0.001</td></tr>
    <tr><td headers="Exit Survey  label" class="gt_row gt_left">module_expectations</td>
<td headers="Exit Survey  stat_1" class="gt_row gt_center">3.50 (3.00, 4.00)</td>
<td headers="Exit Survey  stat_2" class="gt_row gt_center">4.00 (3.00, 4.00)</td>
<td headers="Exit Survey  p.value" class="gt_row gt_center">0.015</td></tr>
    <tr><td headers="Exit Survey  label" class="gt_row gt_left">asynch</td>
<td headers="Exit Survey  stat_1" class="gt_row gt_center">3.00 (3.00, 4.00)</td>
<td headers="Exit Survey  stat_2" class="gt_row gt_center">4.00 (3.00, 5.00)</td>
<td headers="Exit Survey  p.value" class="gt_row gt_center">0.105</td></tr>
    <tr><td headers="Exit Survey  label" class="gt_row gt_left">continue_dart</td>
<td headers="Exit Survey  stat_1" class="gt_row gt_center">4.00 (4.00, 5.00)</td>
<td headers="Exit Survey  stat_2" class="gt_row gt_center">5.00 (4.00, 5.00)</td>
<td headers="Exit Survey  p.value" class="gt_row gt_center">0.006</td></tr>
    <tr><td headers="Exit Survey  label" class="gt_row gt_left">continue_data_science</td>
<td headers="Exit Survey  stat_1" class="gt_row gt_center">4.00 (4.00, 5.00)</td>
<td headers="Exit Survey  stat_2" class="gt_row gt_center">5.00 (4.00, 5.00)</td>
<td headers="Exit Survey  p.value" class="gt_row gt_center"><0.001</td></tr>
    <tr><td headers="Exit Survey  label" class="gt_row gt_left">would_recommend</td>
<td headers="Exit Survey  stat_1" class="gt_row gt_center">4.00 (3.00, 5.00)</td>
<td headers="Exit Survey  stat_2" class="gt_row gt_center">5.00 (4.00, 5.00)</td>
<td headers="Exit Survey  p.value" class="gt_row gt_center"><0.001</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR)</td>
    </tr>
    <tr>
      <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>2</sup></span> Wilcoxon rank sum test</td>
    </tr>
  </tfoot>
</table>
</div>

<img src="../figures/active_past_day_1_needsassessment.tiff" width="50%" /><img src="../figures/active_past_day_1_pretest.tiff" width="50%" /><img src="../figures/active_past_day_1_posttest.tiff" width="50%" />

    ## Warning: Removed 6 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

<img src="../figures/active_past_day_1_exit.tiff" width="50%" />

## Write up

We noted substantial attrition in both waves of the DART program, with
roughly half of our participants failing to complete the post-test
surveys. This level of attrition is typical of online learning programs
(e.g. Hadavand et al. 2018 report 49% attrition between enrollment and
completion in a large sample of online data science learners), but it
still raises important questions about the generalizability of the
results we observe.

Learners who completed the program almost certainly differed from those
who didn’t in important ways, both measurable and unmeasurable, such as
motivation, availability of protected time for study, support from
outside of the DART program (e.g. high-quality mentorship), and more.
This limits the extent to which we can expect these results to
generalize. Our findings are specific to the population who *completed*
the program; we are unable to extrapolate from these data to predict how
effective a program like DART might be in a broader population,
including the population who enrolled in but did not finish our program.

Problems of attrition and self-selection bias are endemic in online
education research, and improving understanding of factors that lead to
attrition is an active line of inquiry (Katy, 2015; Kim et al. 2020). As
with many online learning programs, part of our goal was to lower
barriers to enrollment – we made the program free, with no
prerequisites, advertised it widely, and created fully asynchronous
instruction to allow for maximum flexibility in busy learners’
schedules. A likely consequence of this approach is that a high
proportion of people signed up without actually having the time or
bandwidth to follow through on their learning goals (consider this in
contrast to something like a masters program in data science, where
requiring a substantial upfront investment from learners results in more
selective enrollment, and less attrition). This effect is reflected in
the engagement data we were able to capture in Wave 2 after switching
platforms; of the 419 enrolled learners, only 243 (58%) logged any
activity in their learning pathways after the first day. In other words,
fully 42% of our Wave 2 learners never engaged at all with their
learning pathways, suggesting that they either changed their minds about
participating between enrollment and beginning their learning pathways,
or that they maintained an intention to participate but never found the
time to do so. Interestingly, of the 176 learners who logged no activity
in their learning pathways after the first day, 69 (39%) of them did
complete the post-test surveys at the end of the program and were
included in the final analysis dataset, so their experiences are
reflected in our reported analyses, although they are still
significantly under-represented in the analysis dataset relative to
learners who did log activity on their learning pathways after the first
day (X2 (1, N = 419) = 39.4, p \< .001).
