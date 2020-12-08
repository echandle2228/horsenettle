#' Test pollen tube data
#' 
#' 
#' ### Load Libraries
library(ggplot2)
library(tidyverse)
library(gapminder)
library(forcats)

#' Clear environment and set seed 
remove(list = ls())
set.seed(654616)

#' ### Load data
testRT <- read.csv(file = "PollenTube/test_RT.CSV", header = T, stringsAsFactors = F)
test10C <- read.csv(file = "PollenTube/test_10C.csv", header = T, stringsAsFactors = F)

#' ##  t-test
t.test(testRT$RT ~ testRT$location)
t.test(test10C$X10C ~ test10C$location)

#' ## Create boxplot for north and south
RTplot <- ggplot(testRT, aes(location, RT))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_classic() +
  ggtitle("Room Temperature")+
  ylab("Pollen Tube Length (mm)")+ 
  xlab("") +
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(RTplot)

#' ## Create boxplot for north and south
C10plot <- ggplot(test10C, aes(location, X10C))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_classic() +
  ggtitle("10 C") +
  ylab("Pollen Tube Length (mm)")+ 
  xlab("") +
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(C10plot)
