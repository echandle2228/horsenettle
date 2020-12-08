#' # Chlorophyll data analysis
#' 
#' 
#' ### Load Libraries
library(ggplot2)
library(tidyverse)
library(gapminder)
library(forcats)
library(RVAideMemoire)

#' Clear environment and set seed 
remove(list = ls())
set.seed(654616)

#' ### Load data
chlorophyll <- read.csv(file = "data/chlorophyll.csv", header = T, stringsAsFactors = F)


#' ### Create columns with proportions
chlorophyll$trtpro <- chlorophyll$treatment_final / chlorophyll$treatment_initial
chlorophyll$cntrpro <- chlorophyll$control_final / chlorophyll$control_initial

#' ### Calculate chlorophyll damage using proportions
chlorophyll$chlp_damage <- chlorophyll$cntrpro - chlorophyll$trtpro

#' ## arcsine sqrt transformation for later t-test
chlorophyll$arcsintran <- asin(sqrt(chlorophyll$chlp_damage))


write.csv(x = chlorophyll, file = "data/chlorophyll_calc.csv")


#' ## Describe data variation
#' ### Density Plot
plot(density(chlorophyll$chlp_damage), 
     main="Chlorophyll Data - All", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(chlorophyll$chlp_damage), 2))) 
#' ### Density of north and south separately
north <- chlorophyll[ which(chlorophyll$location=='North'), ]
south <- chlorophyll[ which(chlorophyll$location=='South'), ]
plot(density(north$chlp_damage), 
     main="Chlorophyll Data - North", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(chlorophyll$chlp_damage), 2))) 
plot(density(south$chlp_damage), 
     main="Chlorophyll Data - South", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(chlorophyll$chlp_damage), 2))) 



#' ## T-test analyzing chlorophyll heat damage in north and south populations
t.test(chlorophyll$chlp_damage ~ chlorophyll$location)


#' ## Create boxplot for north and south
chl_boxplot <- ggplot(chlorophyll, aes(location, chlp_damage))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Chlorophyll Damage")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(chl_boxplot)

#' ## Create boxplot for each population
popchl_boxplot <- ggplot(chlorophyll, aes(x= fct_reorder(population,chlp_damage), chlp_damage))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Chlorophyll Damage")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(popchl_boxplot)

MN <- chlorophyll[ which(chlorophyll$population=='Tremp', chlorophyll$population == 'Prairie Island'), ]
t.test(MN$chlp_damage ~ MN$population)



#' ## Analysis without Tremp
noTremp <- chlorophyll[1:48,]

plot(density(noTremp$chlp_damage), 
     main="Chlorophyll Data - All", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(chlorophyll$chlp_damage), 2)))
#' ## T-test analyzing chlorophyll heat damage in north and south populations
t.test(noTremp$chlp_damage ~ noTremp$location)

#' ## Create boxplot for north and south
noTrempNS_boxplot <- ggplot(noTremp, aes(location, chlp_damage))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Chlorophyll Damage")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(noTrempNS_boxplot)

#' ## Boxplot for all populations
noTremp_boxplot <- ggplot(noTremp, aes(x= fct_reorder(population,chlp_damage), chlp_damage))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Chlorophyll Damage")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(noTremp_boxplot)
                  


#' ## Mann-Whitney U, Wilcoxon Signed Rank
wilcox.test(noTremp$chlp_damage ~ noTremp$location)


#' ## arcsin sqrt transformation t-test
t.test(noTremp$arcsintran ~ noTremp$location)

                  
                               