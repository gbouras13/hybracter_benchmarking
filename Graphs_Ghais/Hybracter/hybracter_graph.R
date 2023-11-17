library(tidyverse)

`%nin%` = Negate(`%in%`)


#import data 

library(readr)
benchmarking_combined_dataframe <- read_csv("Output_Tables/benchmarking_combined_dataframe.csv")
combined_dataframe <- read_csv("Output_Tables/snps_indels_combined_dataframe.csv")


# standardise count and add factet factor for long and hybrid 
combined_dataframe$stan_indels<- combined_dataframe$TotalIndels/combined_dataframe$TotalBasesRef*100000
combined_dataframe$stan_snvs<- combined_dataframe$TotalSNPs/combined_dataframe$TotalBasesRef*100000
combined_dataframe$stan_snv_plus_indels<- combined_dataframe$indels_plus_snps/combined_dataframe$TotalBasesRef*100000
combined_dataframe$facet_variable<- ifelse(as.integer(grepl( "ong",combined_dataframe$Run)),1,0 )

combined_dataframe$Total_Large_Insertions_Deletions <- combined_dataframe$InsertionsQry + combined_dataframe$InsertionsRef


#Summerise data 
combined_dataframe %>% 
  group_by(Run) %>%
  summarise(median_SNPs = median(TotalSNPs),
            median_indels = median(TotalIndels),
            median_indels_plus_snps = median(indels_plus_snps))


combined_dataframe %>% 
  group_by(Run) %>%
  summarise(median_SNPs = median(InsertionsQry + InsertionsRef),
            median_indels = min(InsertionsQry + InsertionsRef),
            median_indels_plus_snps = max(InsertionsQry + InsertionsRef) )


library(ggplot2)
library(ggforce)

# select columns and pivot df 
df_snvs_plus_indels<- combined_dataframe  %>%  select(Sample, 
                                                      Run, 
                                                      TotalSNPs, 
                                                      TotalIndels, 
                                                      indels_plus_snps,
                                                      stan_indels,
                                                      stan_snvs,
                                                      stan_snv_plus_indels,
                                                      Total_Large_Insertions_Deletions,
                                                      TotalBasesRef,
                                                      facet_variable)


df_snvs_plus_indels<-df_snvs_plus_indels%>% 
  pivot_longer(
    cols = `TotalSNPs`:`stan_snv_plus_indels`, 
    names_to = "variable",
    values_to = "value")





# Modify the data variable names for graph 

df_snvs_plus_indels$variable <- factor(df_snvs_plus_indels$variable,
                                       levels = c("TotalSNPs",
                                                  "TotalIndels",
                                                  "indels_plus_snps",
                                                  "stan_snvs",
                                                  "stan_indels",
                                                  "stan_snv_plus_indels"),
                                       labels = c("SNVs",
                                                  "INDELs",
                                                  "SNVs + INDELs",
                                                  "SNVs per 100kbp",
                                                  "INDELs per 100kbp",
                                                  "SNVs + INDELs per 100kbp"))




df_snvs_plus_indels$Run <- factor(df_snvs_plus_indels$Run,
                                  levels = c("hybracter_hybrid",
                                             "hybracter_hybrid_last",
                                             "dragonflye_hybrid",
                                             "unicycler",
                                             "hybracter_long",
                                             "hybracter_long_last",
                                             "dragonflye_long"),
                                  labels = c("Hybracter (hybrid)",
                                             "Hybracter (hybrid last)",
                                             "Dragonflye (hybrid)",
                                             "Unicycler",
                                             "Hybracter (long)",
                                             "Hybracter (long last)",
                                             "Dragonflye (long)"))


df_snvs_plus_indels <- df_snvs_plus_indels %>% filter(Run %nin% c("Hybracter (long last)",
                                                                 "Hybracter (hybrid last)"))

# plot data 

stan_hybrid<- df_snvs_plus_indels %>% filter( facet_variable == 0) %>% filter(variable %in% c("SNVs per 100kbp",
                                                                                "INDELs per 100kbp",
                                                                                "SNVs + INDELs per 100kbp" )) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = c("#21207f", "#ff8c00", "#65e8b4", "#4fccd3")) +  # Customize point colors
  scale_fill_manual(values = c("#21207f", "#ff8c00", "#65e8b4", "#4fccd3")) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+
  theme_light(16)+
  labs(x = "",
       y = "Number per 100 kb",
       tag = "A")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))




hybrid<- df_snvs_plus_indels %>% filter( facet_variable == 0) %>% filter(variable %nin% c("SNVs per 100kbp",
                                                                                              "INDELs per 100kbp",
                                                                                              "SNVs + INDELs per 100kbp" )) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = c("#21207f","#ff8c00", "#65e8b4", "#4fccd3")) +  # Customize point colors
  scale_fill_manual(values = c("#21207f","#ff8c00", "#65e8b4", "#4fccd3")) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "B")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))






stan_long<- df_snvs_plus_indels %>% filter( facet_variable == 1) %>% filter(variable %in% c("SNVs per 100kbp",
                                                                                              "INDELs per 100kbp",
                                                                                              "SNVs + INDELs per 100kbp" )) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = c("#468499","#ff8c00", "#00ff7f")) +  # Customize point colors
  scale_fill_manual(values = c("#468499","#ff8c00", "#00ff7f")) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+
  theme_light(16)+
  labs(x = "",
       y = "Number per 100 kb",
       tag = "C")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))




long<- df_snvs_plus_indels %>% 
  filter( facet_variable == 1) %>% 
  filter(variable %nin% c("SNVs per 100kbp","SNVs + INDELs per 100kbp" )) %>%
  ggplot( mapping = aes(x = Run, y = value)) + 
  geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = c("#468499","#ff8c00", "#00ff7f")) +  # Customize point colors
  scale_fill_manual(values = c("#468499","#ff8c00", "#00ff7f")) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "E")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))




# export graph 



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
  scale_color_manual(values = c("#21207f", "#ff8c00", "#65e8b4", "#4fccd3")) +  # Customize point colors
  scale_fill_manual(values = c("#21207f", "#ff8c00", "#65e8b4", "#4fccd3")) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+
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
  scale_color_manual(values =  c("#468499","#ff8c00", "#00ff7f")) +  # Customize point colors
  scale_fill_manual(values =  c("#468499","#ff8c00", "#00ff7f")) +  # Customize violin fill colors
  facet_grid( . ~variable , scales = "free")+
  theme_light(16)+
  labs(x = "",
       y = "Total (N)",
       tag = "D")+
  theme(legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1))



grDevices::dev.size("in")  

# png(filename = "Plots/Fig2.png", units = "in", width = 24, height = 12, res = 600) 

png(filename = "Plots/Fig2.png", units = "in", width = 12, height = 9, res = 600) 

# ggpubr:: ggarrange(stan_hybrid, hybrid,hybrid_large_insertions,
#                    stan_long, long,long_large_insertions, ncol = 3, 
#                    nrow = 2, widths = c(1.4, 1) )

ggpubr:: ggarrange(stan_hybrid,hybrid_large_insertions,
                   stan_long,long_large_insertions, ncol = 2, 
                   nrow = 2, widths = c(2.1, 1) )

dev.off()



# Wall clock time  – 5 tools, 2 runs (8 thread and 16 threads)


# select columns and pivot df 
df_wall_clock_time<- benchmarking_combined_dataframe %>%  select("Wall_Clock_seconds",
                                                                 "Threads",
                                                                 "Run")
# relabel variables for graph 

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

bench_mark_graph<- df_wall_clock_time %>% 
  ggplot( mapping = aes(x = Run, y = Wall_Clock_seconds)) + 
  geom_violin(aes(fill = Run, colour=Run ), alpha = 0.4) +  # Customize fill color and transparency
  geom_point(aes(color = Run), alpha = 1, size = 3) +  # Customize point color, transparency, and size
  scale_color_manual(values = c("#21207f", "#65e8b4", "#4fccd3","#468499", "#00ff7f")) +  # Customize point colors
  scale_fill_manual(values = c("#21207f", "#65e8b4", "#4fccd3", "#468499", "#00ff7f")) +  # Customize violin fill colors
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
