#' # Pollen figures




library(ggplot2)
library(tidyverse)
library(dplyr)
library(plyr)







#' ### Load data
data <- read.csv(file = "data/pollenTube_data.csv", header = T, stringsAsFactors = F)

#' ### Data Processing
data$rate <- data$mean_length / data$time
data$viability <- data$tubes/ (data$tubes + data$no_tubes)


means<-ddply(data,.(location, temp),summarize, mean_length=mean(mean_length), mean_rate=mean(rate), mean_viability=mean(viability),
                     median_length=median(median_length), location=head(location,1), population=head(population,1))

# plot of pollen tube growth rate
meanplot <- ggplot(data = means, aes(x = temp))+
  geom_point(aes(y = means$mean_rate, colour = location), size = 3)+
  geom_line(aes(y= means$mean_rate, colour = location), size = 1)+
  theme_classic()+
  xlab(expression('Temperature ('*~degree*C*')'))+
  ylab("Mean Pollen Tube Growth Rate (mm/hr)")+
  scale_x_continuous(breaks=c(10,15,20,25,30,35,40))+
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=14),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 14),
        legend.title = element_blank())
plot(meanplot)


# plot of pollen viability

viability_plot <- ggplot(data = means, aes(x = temp))+
  geom_point(aes(y = means$mean_viability, colour = location), size = 3)+
  geom_line(aes(y= means$mean_viability, colour = location), size = 1)+
  theme_classic()+
  xlab(expression('Temperature ('*~degree*C*')'))+
  ylab("Mean Viability")+
  scale_x_continuous(breaks=c(10,15,20,25,30, 35,40))+
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=14),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 14),
        legend.title = element_blank())
plot(viability_plot)
