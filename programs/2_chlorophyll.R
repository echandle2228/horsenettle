#############################################################
#' # Hi Temperature Chlorophyll data analysis
#' ## 4/8/2021
#' Emma Chandler
#' 
#' 
###########################################################


#' ### Load Libraries
library(ggplot2)
library(tidyverse)
library(gapminder)
library(forcats)
library(outliers)
library(plyr)


#' Clear environment and set seed 
remove(list = ls())
set.seed(654616)

#' ### Load data
chlorophyll <- read.csv(file = "data/chlorophylldata.csv", header = T, stringsAsFactors = F)


#' ### Create columns with proportions
chlorophyll$trtpro <- chlorophyll$treatment_final / chlorophyll$treatment_initial
chlorophyll$cntrpro <- chlorophyll$control_final / chlorophyll$control_initial

#' ### Calculate chlorophyll damage using proportions
chlorophyll$chlp_tolerance <- 1 - (chlorophyll$cntrpro - chlorophyll$trtpro)



#' ## arcsine sqrt transformation for later t-test
chlorophyll$AST_tolerance <- asin(sqrt(chlorophyll$chlp_tolerance))

#' ### Averaging all ramets of same genotype
chlorophyll_m<-ddply(chlorophyll,.(ID),summarize, AST_tolerance=mean(AST_tolerance),
                     chlp_tolerance=mean(chlp_tolerance), location=head(location,1), population=head(population,1))

write.csv(x = chlorophyll_m, file = "data/processed/Hchloro_processed.csv")




#' ### Omitting Outliers
outliers <- boxplot(data = chlorophyll_m, chlp_tolerance~location, plot=FALSE)$out         
chlorophyll_final<- chlorophyll_m[-which(chlorophyll_m$chlp_tolerance %in% outliers),]



#' ## Describe data variation
#' ### Density Plot
plot(density(chlorophyll$chlp_tolerance), 
     main="Chlorophyll Data - All", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(chlorophyll$chlp_tolerance), 2))) 

#' ### Density of north and south separately
north <- chlorophyll[ which(chlorophyll$location=='North'), ]
south <- chlorophyll[ which(chlorophyll$location=='South'), ]
plot(density(north$chlp_tolerance), 
     main="Chlorophyll Data - North", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(chlorophyll$chlp_tolerance), 2))) 
plot(density(south$chlp_tolerance), 
     main="Chlorophyll Data - South", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(chlorophyll$chlp_tolerance), 2))) 



#' ## T-test analyzing chlorophyll heat damage in north and south populations
t.test(chlorophyll_final$chlp_tolerance ~ chlorophyll_final$location)


#' ## Create boxplot for north and south
chl_boxplot <- ggplot(chlorophyll_final, aes(location, chlp_tolerance))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Chlorophyll Ratio")+ 
  xlab("") +
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=14),
        axis.text.x=element_text(size = 14),
        axis.title.x=element_text(size = 14))
plot(chl_boxplot)




#' ## Create boxplot for each population
popchl_boxplot <- ggplot(chlorophyll, aes(x= fct_reorder(population,chlp_tolerance), chlp_tolerance))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Chlorophyll Damage")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(popchl_boxplot)







#' ## arcsin sqrt transformation t-test
t.test(chlorophyll_m$AST_tolerance ~ chlorophyll_m$location)

#' ## Create boxplot for north and south
chl_boxplot <- ggplot(chlorophyll_m, aes(location, AST_tolerance))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Chlorophyll Stability")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(chl_boxplot)

# png(filename = "figures/chpl_noTremp_noOutliers.png", width = 400, height = 400, units = "px")
# plot(noTrempNS_noOutliers_boxplot)
# dev.off()


#' ## Mann-Whitney U, Wilcoxon Signed Rank
wilcox.test(chlorophyll$AST_tolerance ~ chlorophyll$location) 
