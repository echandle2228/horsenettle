#' # Membrane Stability data analysis
#' 
#' 
#' ### Load Libraries
library(ggplot2)
library(tidyverse)
library(gapminder)
library(forcats)

#' Clear environment and set seed 
remove(list = ls())
set.seed(9516519)


north_CMS <- rnorm(n = 25, mean = 82, sd = 5)
location_n <-c("North")
north <-cbind(north_CMS, location_n)

south_CMS <- rnorm(n = 25, mean = 75, sd = 5)
location_s <-c("South")
south <-cbind(south_CMS, location_s)

full <- as.data.frame(rbind(north, south))


names(full)[names(full) == "north_CMS"] <- "CMS"
names(full)[names(full) == "location_n"] <- "location"
typeof(full$CMS)
full$CMS <- as.numeric(full$CMS)


#' ## Create boxplot for north and south
cold_box <- ggplot(full, aes(location, CMS))+ 
  geom_boxplot(outlier.shape=NA)+
  geom_jitter(width=0.2)+
  theme_classic() +
  ylab("Cell Membrane Stability")+ 
  xlab("") +
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(cold_box)

png(filename = "figures/cold_box_fake.png", width = 400, height = 400, units = "px")
plot(cold_box)
dev.off()
