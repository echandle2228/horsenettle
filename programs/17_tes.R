###################################################################

# Pollen Germination Analysis and Figures
# Emma Chandler
# November 12, 2012

##################################################################

remove(list = ls())

# R Practice --------------------------------------------------------------

# Operators
2+2
2-1
4/2
4*2
2^2
log(456)
log10(456)


# Vector
x <- c(41,25,65,75,98)
mean(x)
median(x)
summary(x)


# Dataframe
y <- c(44,22,66,77,99)
xy <- data.frame(x,y)
xy$z <- c("small", "small", "big", "big", "big")

#Quick Plots
plot(x=x, y=y, xlab = "x", ylab = "y")
lm(y~x)

boxplot(data = xy, y~z)
t.test(data = xy, y~z)

# Nice plots! ggplot
library(ggplot2)
ggplot(data = xy, aes(x= z, y=y, fill = z)) +
  geom_boxplot()+
  geom_point()+
  theme_classic()+
  labs(x = "Size", y = "Mass", title = "Mass given size")



# Pollen Germination ------------------------------------------------------

# Load Libraries
library(rcompanion)
library(ggstatsplot)
library(dplyr)
library(tidyverse)


# Load Data
getwd()
setwd("C:/Users/moin2/OneDrive/Documents/Horsenettle/")

bilin <- read.csv("data/PollenGerm.csv", header = TRUE)

germ_dat <- read.csv("data/pollenTube_NEW.csv", header = TRUE)


# cALCULATE POLLEN GERMINATION
germ_dat$germ_percent <- germ_dat$tubes / germ_dat$total_grains *100


# Plot Data
gd <- germ_dat %>% 
  group_by(location, temp) %>% 
  summarise(germ_percent = mean(germ_percent))


ggplot(germ_dat, aes(x = temp, y = germ_percent, color = location))+
  geom_point()+
  geom_line(aes(group = ID)) +
  geom_line(data = gd, alpha = 0.8, size = 3)+
  theme_classic()+
  labs(x = "Temperature", y = "Percent Germination", title = "Percent Germination") +
  scale_color_manual(values = c("dodgerblue", "red2"))+
  theme(text = element_text(family = "serif"),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title = element_text(size = 14),
        plot.title = element_text(size = 20, vjust = 1, hjust = 0.5),
        legend.text = element_text(size = 12),
        legend.title = element_blank())


# Bilinear Fit ------------------------------------------------------------

  
# Data description
summary(bilin)

hist(bilin$max_germ, main = "Maximum Germination")  
hist(bilin$Tmin, main = "Tmin")
hist(bilin$Tmax, main = "Tmax")
hist(bilin$Topt, main = "Topt")


# T-test for max germination
t.test(bilin$max_germ ~ bilin$location)

ggplot(bilin, aes(x = location, y = max_germ, fill = location)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)+
  theme_classic()+
  labs(x = "Location", y = "Maximum Germination", title = "Maximum Germination") +
  scale_fill_manual(values = c("dodgerblue", "red2"))+
  theme(text = element_text(family = "serif"),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title = element_text(size = 14),
        plot.title = element_text(size = 20, vjust = 1, hjust = 0.5),
        legend.text = element_text(size = 12),
        legend.title = element_blank())



t.test(bilin$Tmax ~ bilin$location)

ggplot(bilin, aes(x = location, y = Tmax, fill = location)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)+
  theme_classic()+
  labs(x = "Location", y = "Temperature", title = "Tmax") +
  scale_fill_manual(values = c("dodgerblue", "red2"))+
  theme(text = element_text(family = "serif"),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title = element_text(size = 14),
        plot.title = element_text(size = 20, vjust = 1, hjust = 0.5),
        legend.text = element_text(size = 12),
        legend.title = element_blank())





t.test(bilin$Tmin ~ bilin$location)

ggplot(bilin, aes(x = location, y = Tmin, fill = location)) +
  geom_boxplot(aes(middle = mean(Tmin))) +
  geom_jitter(width = 0.1)+
  theme_classic()+
  labs(x = "Location", y = "Temperature", title = "Tmin") +
  scale_fill_manual(values = c("dodgerblue", "red2"))+
  theme(text = element_text(family = "serif"),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title = element_text(size = 14),
        plot.title = element_text(size = 20, vjust = 1, hjust = 0.5),
        legend.text = element_text(size = 12),
        legend.title = element_blank())

ggsave("figures/Tmin.png", width = 7, height = 5, dpi = 300)



















