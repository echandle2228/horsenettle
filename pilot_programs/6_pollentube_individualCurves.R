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
set.seed(98432)

#' ### Load data
mean <- read.csv(file = "PollenTube/mean.csv", header = T, stringsAsFactors = F)
median <- read.csv(file = "PollenTube/media.csv", header = T, stringsAsFactors = F)
pollenviab <- read.csv(file = "PollenTube/pollenviab.csv", header = T, stringsAsFactors = F)

meanplot <- ggplot(data = mean, aes(x=Temp)) + 
  geom_line(aes(y = OP3, colour = "TX: Oil Patch 3"), size = 2) + 
  geom_line(aes(y = PL5, colour="TX: Parking Lot 5"), size = 2)+ 
  geom_line(aes(y = PI4, colour="MN: Prairie Island 4"), size = 2)+ 
  geom_line(aes(y = PI11, colour="MN: Prairie Island 11"), size = 2)+
  scale_colour_manual(name = '', values=c("TX: Oil Patch 3" = "red", "TX: Parking Lot 5" = "orange", 
                                          "MN: Prairie Island 4" = "darkblue", "MN: Prairie Island 11" = "blue"))+
  theme_classic()+
  xlab(expression('Temperature ('*~degree*C*')'))+
  ylab("Mean Pollen Tube Length (mm)")+
  scale_x_continuous(breaks=c(10, 25))+
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=14),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 14),
        legend.title = element_blank(),
        legend.position = "right")
plot(meanplot)

png(filename = "figures/pollentube_mean.png", width = 400, height = 400, units = "px")
plot(meanplot)
dev.off()

  
medianplot <- ggplot(data = median, aes(x=Temp)) + 
  geom_line(aes(y = OP3, colour = "TX: Oil Patch 3"), size = 2) + 
  geom_line(aes(y = PL5, colour="TX: Parking Lot 5"), size = 2)+ 
  geom_line(aes(y = PI4, colour="MN: Prairie Island 4"), size = 2)+ 
  geom_line(aes(y = PI11, colour="MN: Prairie Island 11"), size = 2)+
  scale_colour_manual(name = '', values=c("TX: Oil Patch 3" = "red", "TX: Parking Lot 5" = "orange", 
                                          "MN: Prairie Island 4" = "darkblue", "MN: Prairie Island 11" = "blue"))+
  theme_classic()+
  xlab(expression('Temperature ('*~degree*C*')'))+
  ylab("Median Pollen Tube Length (mm)")+
  scale_x_continuous(breaks=c(10, 25))+
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=14),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 14),
        legend.title = element_blank(),
        legend.position = "right")
plot(medianplot)

png(filename = "figures/pollentube_median.png", width = 400, height = 400, units = "px")
plot(medianplot)
dev.off()

pollenviabplot <- ggplot(data = pollenviab, aes(x=Temp)) + 
  geom_line(aes(y = OP3, colour = "TX: Oil Patch 3"), size = 2) + 
  geom_line(aes(y = PL5, colour="TX: Parking Lot 5"), size = 2)+ 
  geom_line(aes(y = PI4, colour="MN: Prairie Island 4"), size = 2)+ 
  geom_line(aes(y = PI11, colour="MN: Prairie Island 11"), size = 2)+
  scale_colour_manual(name = '', values=c("TX: Oil Patch 3" = "red", "TX: Parking Lot 5" = "orange", 
                                          "MN: Prairie Island 4" = "darkblue", "MN: Prairie Island 11" = "blue"))+
  theme_classic()+
  xlab(expression('Temperature ('*~degree*C*')'))+
  ylab("Pollen Viability Ratio")+
  scale_x_continuous(breaks=c(10, 25))+
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=14),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 14),
        legend.title = element_blank(),
        legend.position = "right")
plot(pollenviabplot)

png(filename = "figures/pollentube_pollenviab.png", width = 400, height = 400, units = "px")
plot(pollenviabplot)
dev.off()




