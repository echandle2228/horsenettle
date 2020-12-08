#' # Correlation of chlorophyll and CMS



#' ### Load Libraries
library(ggplot2) 
library(gridExtra)
library(grid)
library(lattice)
library(ggpubr)
library(extrafont)

#' Clear environment and set seed 
remove(list = ls())
set.seed(65432)

#' ### Load data
chlorophyll <- read.csv(file = "data/chlorophyll_inv_calc.csv", header = T, stringsAsFactors = F)
CMS <- read.csv(file = "data/membraneStability_calc.csv", header = T, stringsAsFactors = F)

#' Combine chlorophyll and CMS data
correlation <- merge(CMS, chlorophyll, by=1:3)

#' Correlation of chlorophyll damage and CMS
cor(correlation$CMS,correlation$chlp_tolerance, method="pearson") 


#' ### ggscatter method with grid.arrange
correlation_plot <- ggscatter(correlation, x = "CMS", y = "chlp_tolerance", size = 1, add = "reg.line") +
  stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),
           label.x.npc = "left",            
           label.y.npc = "top") +
  theme_classic() +
  xlab("Cell Membrane Stability") + ylab("Chlorophyll Stability") +
  theme(axis.text.y=element_text(size=10, colour = "black"),         
        axis.title.y=element_text(size=12, colour = "black"),         
        axis.text.x=element_text(size = 10, colour = "black"),                  
        axis.title.x=element_text(size = 12, colour = "black"))
plot(correlation_plot)
