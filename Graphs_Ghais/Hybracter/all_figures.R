library(tidyverse)
library(stringr)
library(ggpubr)

### Figure 2 ###

df_snvs_plus_indels <- readRDS("RDS/df_snvs_plus_indels.rds")

# Modify the data variable names for graph 

df_snvs_plus_indels$variable <- factor(df_snvs_plus_indels$variable,
                                       levels = c("TotalSNPs",
                                                  "TotalIndels",
                                                  "indels_plus_snps"),
                                       labels = c("SNVs",
                                                  "INDELs",
                                                  "SNVs + INDELs"))




df_snvs_plus_indels$Run <- factor(df_snvs_plus_indels$Run,
                                  levels = c("hybracter_hybrid",
                                             "dragonflye_hybrid",
                                             "unicycler",
                                             "hybracter_long",
                                             "dragonflye_long"),
                                  labels = c("Hybracter (hybrid)",
                                             "Dragonflye (hybrid)",
                                             "Unicycler",
                                             "Hybracter (long)",
                                             "Dragonflye (long)"))


# plot data 

colourlisthybrid <- c("#21207f","#ff8c00", "#65e8b4")
colourlistlong <- c("#468499", "grey50")

hybrid <- df_snvs_plus_indels %>% filter( facet_variable == 0) %>% 
  filter(variable %in% c("SNVs",
                         "INDELs",
                         "SNVs + INDELs" )) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = colourlisthybrid) +  # Customize point colors
  scale_fill_manual(values = colourlisthybrid) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "A")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))




long<- df_snvs_plus_indels %>% 
  filter( facet_variable == 1) %>% 
  filter(variable %in% c("SNVs",
                         "INDELs",
                         "SNVs + INDELs" )) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = colourlistlong) +  # Customize point colors
  scale_fill_manual(values = colourlistlong) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "C")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))




# total insertions

df_ins <- df_snvs_plus_indels

df_ins$value <- df_ins$Total_Large_Insertions_Deletions
df_ins <- df_ins %>% filter(variable == "SNVs")
df_ins$variable <- "Large Insertions + Deletions"

hybrid_large_insertions <- df_ins %>% 
  filter( facet_variable == 0) %>% 
  filter(variable %in% c("Large Insertions + Deletions")) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = colourlisthybrid) +  # Customize point colors
  scale_fill_manual(values = colourlisthybrid) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+ 
  scale_y_continuous(breaks = function(x) unique(floor(pretty(seq(min(x), (max(x) + 1) * 1.1))))) +
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "B")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))

long_large_insertions <- df_ins %>% 
  filter( facet_variable == 1) %>% 
  filter(variable %in% c("Large Insertions + Deletions")) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values =  colourlistlong) +  # Customize point colors
  scale_fill_manual(values =  colourlistlong) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+ 
  scale_y_continuous(breaks = function(x) unique(floor(pretty(seq(min(x), (max(x) + 1) * 1.1))))) +
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "D")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))



grDevices::dev.size("in")  

png(filename = "Plots/Fig2.png", units = "in", width = 12, height = 9, res = 600) 


ggpubr:: ggarrange(hybrid,hybrid_large_insertions,
                   long,long_large_insertions, ncol = 2, 
                   nrow = 2, widths = c(2.1, 1) )

dev.off()



###
# Fig 3
####


df_wall_clock_time <- readRDS("RDS/df_wall_clock_time.rds")

df_wall_clock_time$Run <- factor(df_wall_clock_time$Run,
                                 levels = c("hybracter_hybrid",
                                            "dragonflye_hybrid",
                                            "unicycler",
                                            "hybracter_long",
                                            "dragonflye_long"),
                                 labels = c("Hybracter (hybrid)",
                                            "Dragonflye (hybrid)",
                                            "Unicycler",
                                            "Hybracter (long)",
                                            "Dragonflye (long)"))


df_wall_clock_time$Threads<- factor(df_wall_clock_time$Threads,
                                    levels = c(8,
                                               16),
                                    labels = c("8 threads",
                                               "16 threads"))







# plot data 

colourlist <- c("#21207f","#ff8c00", "#65e8b4","#468499", "grey50")

bench_mark_graph<- df_wall_clock_time %>% 
  ggplot( mapping = aes(x = Run, y = Wall_Clock_seconds)) + 
  geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = colourlist) +  # Customize point colors
  scale_fill_manual(values = colourlist) +  # Customize violin fill colors
  facet_grid( . ~Threads, scales = "free")+
  theme_light(16)+
  labs(x = "",
       y = "Wall clock time (sec)",
       tag = "")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))


# export graph 

png(filename = "Plots/Fig3.png", units = "in", width = 13, height = 9.5, res = 600) 

bench_mark_graph

dev.off()



### 
# Fig 4
###


##### plot
#####

combined_dataframe_depth <- readRDS("RDS/combined_dataframe_depth.rds")



combined_dataframe_depth$Run <- factor(combined_dataframe_depth$Run,
                                       levels = c("hybracter_hybrid",
                                                  "dragonflye_hybrid",
                                                  "unicycler",
                                                  "hybracter_long",
                                                  "dragonflye_long"),
                                       labels = c("Hybracter (hybrid)",
                                                  "Dragonflye (hybrid)",
                                                  "Unicycler",
                                                  "Hybracter (long)",
                                                  "Dragonflye (long)"))

plot_df <-combined_dataframe_depth%>% 
  pivot_longer(
    cols = `SNV_plus_indel_plus_large_indels`:`indels_plus_snps`, 
    names_to = "variable",
    values_to = "value")


# hybrid colours
colourlist <- c("#21207f","#ff8c00", "#65e8b4","#468499", "grey50")


plot_df_snp_indels <- plot_df %>% 
  filter(variable %in% c("TotalSNPs",
                         "TotalIndels",
                         "InsertionsRef"))

plot_df_snp_indels$variable <- gsub("TotalSNPs", "SNVs", plot_df_snp_indels$variable )
plot_df_snp_indels$variable <- gsub("TotalIndels", "Small InDels", plot_df_snp_indels$variable )
plot_df_snp_indels$variable <- gsub("InsertionsRef", "Large InDels", plot_df_snp_indels$variable )

large_indels_label <- "Custom Label for Large Indels"



snvs <- ggplot(plot_df_snp_indels %>% 
                 filter(variable %in% c(
                   "SNVs")), 
               aes(x = Sample, y = value, color = Run)) +
  geom_point(aes(color = Run),position = position_dodge(width = 0.5), 
             alpha = 0.9, size = 3.5) +
  labs(x = "Depth", y = NULL) +
  scale_color_manual(values = colourlist, name = "Method") +  
  theme_light(16) +
  facet_grid( . ~variable , scales = "free") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  +
  labs(x = "Depth", y = "Total (N)",
       tag = "C")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


smallindel <- ggplot(plot_df_snp_indels %>% 
                       filter(variable %in% c(
                         "Small InDels")), 
                     aes(x = Sample, y = value, color = Run)) +
  geom_point(aes(color = Run),position = position_dodge(width = 0.5), 
             alpha = 0.9, size = 3.5) +
  labs(x = "Depth", y = NULL) +
  scale_color_manual(values = colourlist, name = "Method") +  
  theme_light(16) +
  facet_grid( . ~variable , scales = "free") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  +
  labs(x = "Depth", y = "Total (N)",
       tag = "A")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))

largeindels <- ggplot(plot_df_snp_indels %>% 
                        filter(variable %in% c(
                          "Large InDels")), 
                      aes(x = Sample, y = value, color = Run)) +
  geom_point(aes(color = Run),position = position_dodge(width = 0.5), 
             alpha = 0.9, size = 3.5) +
  labs(x = "Depth", y = NULL) +
  scale_color_manual(values = colourlist, name = "Method") +  
  theme_light(16) +
  facet_grid( . ~variable , scales = "free") +
  theme(legend.position="none", axis.text.x = element_text(angle = 45, hjust = 1))  +
  labs(x = "Depth", y = "Total (N)",
       tag = "B")


grDevices::dev.size("in")  


png(filename = "Plots/Fig4.png", units = "in", width = 12, height = 9, res = 600) 

ggarrange(ggarrange(smallindel, largeindels, ncol = 2), 
          ggarrange(snvs), 
          nrow = 2)

dev.off()


# Save Output 

plot_df_snp_indels$facet_variable <- NULL

write.csv(plot_df_snp_indels, file = "Output_Tables/depth_stats.csv", row.names = F)


############
# sups
###########3



# plot data 

make_supp_plot <- function(sample_list, violin = TRUE) {

colourlisthybrid <- c("#21207f","#ff8c00", "#65e8b4")
colourlistlong <- c("#468499", "grey50")

hybrid <- df_snvs_plus_indels %>% 
  filter(Sample %in% sample_list) %>% 
  filter( facet_variable == 0) %>% 
  filter(variable %in% c("SNVs",
                         "INDELs",
                         "SNVs + INDELs" )) %>%
  ggplot( mapping = aes(x = Run, y = value)) +
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = colourlisthybrid) +  # Customize point colors
  scale_fill_manual(values = colourlisthybrid) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "A")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))

if (violin == TRUE){
  
  hybrid <- hybrid  + 
    geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4)   # Customize fill color and transparency
  
}



long<- df_snvs_plus_indels %>% 
  filter(Sample %in% sample_list) %>% 
  filter( facet_variable == 1) %>% 
  filter(variable %in% c("SNVs",
                         "INDELs",
                         "SNVs + INDELs" )) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  #geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = colourlistlong) +  # Customize point colors
  scale_fill_manual(values = colourlistlong) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "C")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))

if (violin == TRUE){
  
  long <- long  + 
    geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4)   # Customize fill color and transparency
  
}


# total insertions

df_ins <- df_snvs_plus_indels

df_ins$value <- df_ins$Total_Large_Insertions_Deletions
df_ins <- df_ins %>% filter(variable == "SNVs")
df_ins$variable <- "Large Insertions + Deletions"

hybrid_large_insertions <- df_ins %>% 
  filter(Sample %in% sample_list) %>% 
  filter( facet_variable == 0) %>% 
  filter(variable %in% c("Large Insertions + Deletions")) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  #geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = colourlisthybrid) +  # Customize point colors
  scale_fill_manual(values = colourlisthybrid) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+ 
  scale_y_continuous(breaks = function(x) unique(floor(pretty(seq(min(x), (max(x) + 1) * 1.1))))) +
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "B")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))


if (violin == TRUE){
  
  hybrid_large_insertions <- hybrid_large_insertions  + 
    geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4)   # Customize fill color and transparency
  
}



long_large_insertions <- df_ins %>% 
  filter(Sample %in% sample_list) %>% 
  filter( facet_variable == 1) %>% 
  filter(variable %in% c("Large Insertions + Deletions")) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  #geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values =  colourlistlong) +  # Customize point colors
  scale_fill_manual(values =  colourlistlong) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+ 
  scale_y_continuous(breaks = function(x) unique(floor(pretty(seq(min(x), (max(x) + 1) * 1.1))))) +
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "D")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))


if (violin == TRUE){
  
  long_large_insertions <- long_large_insertions  + 
    geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4)   # Customize fill color and transparency
  
}

p <- ggpubr:: ggarrange(hybrid,hybrid_large_insertions,
                        long,long_large_insertions, ncol = 2, 
                        nrow = 2, widths = c(2.1, 1) )


return(p)

}


grDevices::dev.size("in")  

### SF1  Lower quality data ###

lower_quality_samples <- c("JKD6159_R9",  "H37R2",
                           "ATCC_10708_FAST_Simplex","ATCC_17802_FAST_Simplex",
                           "ATCC_25922_FAST_Simplex", "ATCC_33560_FAST_Simplex", 
                           "ATCC_BAA_679_FAST_Simplex")

png(filename = "Plots/SF1.png", units = "in", width = 12, height = 9, res = 600) 

make_supp_plot(lower_quality_samples)

dev.off()

unique(df_snvs_plus_indels$Sample)


### SF2  sup simplex ###

medium_quality_samples <- c("JKD6159_R10","ATCC_10708_SUP_Simplex" ,   "ATCC_17802_SUP_Simplex"  ,  "ATCC_25922_SUP_Simplex" ,  
                            "ATCC_33560_SUP_Simplex" ,   "ATCC_BAA_679_SUP_Simplex",
                            "Lerminiaux_isolateA", "Lerminiaux_isolateB", "Lerminiaux_isolateC",  "Lerminiaux_isolateD" ,     
                            "Lerminiaux_isolateE"   ,    "Lerminiaux_isolateF"   ,    "Lerminiaux_isolateG"  ,    
                            "Lerminiaux_isolateH"   ,    "Lerminiaux_isolateI"   ,    "Lerminiaux_isolateJ"   ,   
                            "Lerminiaux_isolateK"   ,    "Lerminiaux_isolateL")

png(filename = "Plots/SF2.png", units = "in", width = 12, height = 9, res = 600) 

make_supp_plot(medium_quality_samples)

dev.off()

### SF3  sup duplex ###

duplex_quality_samples <- c("ATCC_10708_SUP_Duplex"   , 
                            "ATCC_17802_SUP_Duplex"    , "ATCC_25922_SUP_Duplex" ,    "ATCC_33560_SUP_Duplex"    ,
                            "ATCC_BAA_679_SUP_Duplex")

png(filename = "Plots/SF3.png", units = "in", width = 12, height = 9, res = 600) 

make_supp_plot(duplex_quality_samples)

dev.off()
