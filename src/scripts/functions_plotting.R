library(ggplot2)
theme_set(theme_classic())

chop_blue <- "#41b6e6"
chop_blue_light1 <- "#4fbbe8"
chop_blue_light2 <- "#63c3ea"
chop_blue_light3 <- "#76caed"
chop_blue_light4 <- "#8ad2f0"
chop_blue_light5 <- "#9dd9f2"
chop_blue_light6 <- "#b1e1f5"
chop_blue_light7 <- "#c4e8f7"
chop_blue_light8 <- "#d8f0fa"
chop_blue_light9 <- "#ebf7fc"
chop_darkblue <- "#005587"
chop_pink <- "#ed1f7f"
chop_pink_light1 <- "#eb3684"
chop_pink_light2 <- "#ed4c91"
chop_pink_light3 <- "#ef629f"
chop_pink_light4 <- "#f179ad"
chop_pink_light5 <- "#f48fba"
chop_pink_light6 <- "#f6a6c8"
chop_pink_light7 <- "#f8bcd6"
chop_pink_light8 <- "#fad2e4"
chop_pink_light9 <- "#fde9f1"
chop_green <- "#91a01e"
chop_brown <- "#786452"
chop_brown_text <- "#55473c"


save_and_print <- function(plot, filename, width = NA, height = NA){
  ggplot2::ggsave(filename = filename, 
         plot = plot, 
         path = here::here("reports", "figures"),
         width = width, 
         height = height, 
         units = "in")
  
  knitr::include_graphics(here::here("reports", "figures", filename))
}

# used in explore_clusters.rmd report
plot_by_theme <- function(df, cluster){
  
  stopifnot(require(ggplot2))
  
  # report number of participants in each cluster
  counts <- df |> 
    dplyr::count(record_id, {{cluster}}) |> 
    dplyr::count(cluster = {{cluster}})
  
  # data types
  p1 <- df |> 
    dplyr::filter(topic %in% c("ehr", "geospatial", "image", "longitudinal", "nlp", "omics", "use_others_data")) |> 
    ggplot(aes(x=value)) + 
    facet_grid(question ~ topic) + 
    labs(x=NULL, y=NULL, title = "Data types") +
    geom_density(aes(fill = {{cluster}}, color = {{cluster}}), alpha=.3) +
    labs(fill = "cluster", color = "cluster") +
    theme(legend.position="bottom")
  
  # techniques
  p2 <- df |> 
    dplyr::filter(topic %in% c("automation", "collaboration", "data_mining", "sup_ml", "unsup_ml", "data_viz")) |> 
    ggplot(aes(x=value))+ 
    facet_grid(question ~ topic) + 
    labs(x=NULL, y=NULL, title = "Techniques") +
    geom_density(aes(fill = {{cluster}}, color = {{cluster}}), alpha=.3) +
    labs(fill = "cluster", color = "cluster") +
    theme(legend.position="bottom")
  
  # tools
  p3 <- df |> 
    dplyr::filter(topic %in% c("python", "r", "sql")) |> 
    ggplot(aes(x=value)) + 
    facet_grid(question ~ topic) + 
    labs(x=NULL, y=NULL, title = "Tools") +
    geom_density(aes(fill = {{cluster}}, color = {{cluster}}), alpha=.3) +
    labs(fill = "cluster", color = "cluster") +
    theme(legend.position="bottom")
  
  return(list(counts = counts, data_types = p1, techniques = p2, tools = p3))
}

# used in explore_clusters.rmd report
rank_topics <- function(df, cluster, n_clusters, questions = c("expertise", "relevance", "learn"), breaks = 1:5, limits = c(.5,5.5), alpha = .7){
  
  stopifnot(require(ggplot2))
  
  # create an empty list to store the plots in
  plots <- vector(mode = "list", length = n_clusters)
  
  for(this_cluster in 1:n_clusters){
    
    # create an empty slot for each question 
    plots[[this_cluster]] <- vector(mode = "list", length = 3)
    names(plots[[this_cluster]]) <- questions
    
    # how many participants in this cluster?
    df_this_cluster <- df |> 
      dplyr::filter({{cluster}} == this_cluster)
    n <- length(unique(df_this_cluster$record_id))
    # create the string to be used for plot titles
    title <- ifelse(n_clusters == 1, paste0("All (N=", n, ")"),
                    paste0("Cluster ", this_cluster, " (N=", n, ")"))
    
    for(this_question in questions){
      p <- df_this_cluster |> 
        # plot just the data for this cluster, and this question (expertise, relevance or learn)
        dplyr::filter(question == this_question) |> 
        # reorder the topics by mean, so topics rated higher are at the top of the plot
        ggplot(aes(x=value, y=forcats::fct_reorder(topic, value, mean))) +
        # there will only be one facet, but this adds the question name nicely
        facet_wrap(~question) +
        labs(title = title, x=NULL, y=NULL) + 
        scale_x_continuous(breaks = breaks, limits = limits)
      
      if( n >= 5) {
        # as long as there's at least 5 people in cluster, plot a boxplot, but omit the dots for outliers
        p <- p + geom_boxplot(outlier.shape = NA) + 
          # overlay all of the data as points
          geom_jitter(aes(color = topic), width = .2, alpha = .4, show.legend = FALSE)
      } else {
        # overlay all of the data as points
        p <- p + geom_jitter(aes(color = topic), width = .2, alpha = alpha, show.legend = FALSE)
      }
      
      # save plot 
      plots[[this_cluster]][[this_question]] <- p
    }
  }
  return(plots)
}
