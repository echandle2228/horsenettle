##########################################################################

# Pollen Germination Analysis and Figures
# Emma Chandler
# November 12, 2021

#############################################################################


# R Practice --------------------------------------------------------------

# Operators
2+2
2-1
4/2
4*2
2^2
log10(456)
log(456)

# Creating an object
# Vector
x <- c(41,25,65,75,98)
mean(x)
median(x)
summary(x)

y <- c(44,22,66,77,99)

# Dataframe
xy <- data.frame(x,y)
xy$z <- c("small", "small", "big", "big", "big")


# Quick Plots
plot(x = x, y = y)
lm(y~x)

boxplot(data = xy, y~z)
t.test(data = xy, y~z)

# Nice Plots! ggplot package
install.packages(ggplot)
library(ggplot2)

ggplot(data = xy, aes(x = z, y = y, fill = z)) +
  geom_boxplot()+
  geom_point()+
  theme_classic() +
  labs(x = "Size", y = "Mass", title = "Comparison of mass by size category")



# Load Pollen Data --------------------------------------------------------

# Remove everything from the environment
remove(list = ls())


# Load Libraries
library(ggplot2)
library(rcompanion)
library(ggstatsplot)
library(dplyr)
library(tidyverse)


# Find working directory
getwd()
setwd("C:/Users/moin2/OneDrive/Documents/Horsenettle")

# Load data
bilin <- read.csv("data/PollenGerm.csv", header = TRUE)
head(bilin)

germ_dat <- read.csv("~/Horsenettle/data/pollenTube_NEW.csv", header = TRUE)
head(germ_dat)



# Pollen Germination ------------------------------------------------------

# Calculate pollen germination
germ_dat$germ_percent <- germ_dat$tubes / germ_dat$total_grains *100



# Plot Data
gd <- germ_dat %>% 
  group_by(location, temp) %>% 
  summarise(germ_percent = mean(germ_percent))


ggplot(germ_dat, aes(x = temp, y = germ_percent, color = location)) +
  geom_point() +
  geom_line(aes(group = ID)) +
  geom_line(data = gd, alpha = .8, size = 3) +
  theme_classic() +
  labs(x = expression(paste('Temperature (',~degree,'C)',sep='')), 
       y = "Percent Germination") +
  scale_colour_manual(values = c("dodgerblue", "red2")) +
  theme(text = element_text(family = "serif"), 
        axis.text.x = element_text(size = 12), 
        axis.text.y = element_text(size = 12),
        axis.title = element_text(size = 14),
        plot.title = element_text(size = 20, vjust = 1, hjust = 0.5),
        panel.grid = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), units = , "cm"),
        legend.text = element_text(size = 12),
        legend.title = element_blank())



# http://derekogle.com/NCGraphing/resources/colors 



# Bilinear Fit Data Analysis ----------------------------------------------

# Data description
summary(bilin)


hist(bilin$max_germ, main = "Maximum Germination")

hist(bilin$Tmin, main = "Tmin")

hist(bilin$Tmax, main = "Tmax")

hist(bilin$Topt, main = "Topt")

ggplot(bilin) +
  geom_histogram(aes(bilin$max_germ))



# T-test for maximum germination
t.test(bilin$max_germ ~ bilin$location)

ggplot(bilin, aes(location, max_germ, fill = location)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)+
  theme_bw()+ 
  labs(x = "Location", 
       y = "Maximum Germination (%)", 
       title = "Maximum Germination") +
  scale_color_manual(values = c("dodgerblue", "red2")) +
  scale_fill_manual(values = c("dodgerblue", "red2"))+
  theme(text = element_text(family = "serif"), 
        axis.text.x = element_text(size = 12), 
        axis.text.y = element_text(size = 12),
        axis.title = element_text(size = 14),
        plot.title = element_text(size = 20, vjust = 1, hjust = 0.5),
        panel.grid = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), units = , "cm"),
        legend.text = element_text(size = 12),
        legend.title = element_blank())
  

# T-test for minimum germination temperature
t.test(bilin$Tmin ~ bilin$location)

ggplot(bilin, aes(location, Tmin, fill = location)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)+
  theme_bw()+ 
  labs(x = "Location", 
       y = expression(paste('Temperature (',~degree,'C)',sep='')), 
       title = "Minimum Germination Temperature") +
  scale_color_manual(values = c("dodgerblue", "red2")) +
  scale_fill_manual(values = c("dodgerblue", "red2"))+
  theme(text = element_text(family = "serif"), 
        axis.text.x = element_text(size = 12), 
        axis.text.y = element_text(size = 12),
        axis.title = element_text(size = 14),
        plot.title = element_text(size = 20, vjust = 1, hjust = 0.5),
        panel.grid = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), units = , "cm"),
        legend.text = element_text(size = 12),
        legend.title = element_blank())


# T-test for maximum germination
t.test(bilin$Tmax ~ bilin$location)

ggplot(bilin, aes(location, Tmax, fill = location)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)+
  theme_bw()+ 
  labs(x = "Location", 
       y = expression(paste('Temperature (',~degree,'C)',sep='')), 
       title = "Maximum Germination Temperature") +
  scale_color_manual(values = c("dodgerblue", "red2")) +
  scale_fill_manual(values = c("dodgerblue", "red2"))+
  theme(text = element_text(family = "serif"), 
        axis.text.x = element_text(size = 12), 
        axis.text.y = element_text(size = 12),
        axis.title = element_text(size = 14),
        plot.title = element_text(size = 20, vjust = 1, hjust = 0.5),
        panel.grid = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), units = , "cm"),
        legend.text = element_text(size = 12),
        legend.title = element_blank())


# T-test for maximum germination
t.test(bilin$Topt ~ bilin$location)

ggplot(bilin, aes(location, Topt, fill = location)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)+
  theme_bw()+ 
  labs(x = "Location", 
       y = expression(paste('Temperature (',~degree,'C)',sep='')), 
       title = "Optimum Germination Temperature") +
  scale_color_manual(values = c("dodgerblue", "red2")) +
  scale_fill_manual(values = c("dodgerblue", "red2"))+
  theme(text = element_text(family = "serif"), 
        axis.text.x = element_text(size = 12), 
        axis.text.y = element_text(size = 12),
        axis.title = element_text(size = 14),
        plot.title = element_text(size = 20, vjust = 1, hjust = 0.5),
        panel.grid = element_blank(),
        plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), units = , "cm"),
        legend.text = element_text(size = 12),
        legend.title = element_blank())


