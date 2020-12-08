#' # Chlorophyll data analysis
#' 
#' 
#' ### Load Libraries
library(ggplot2)
library(tidyverse)
library(gapminder)
library(forcats)
library(outliers)


#' Clear environment and set seed 
remove(list = ls())
set.seed(654616)

#' ### Load data
chlorophyll <- read.csv(file = "data/chlorophyll.csv", header = T, stringsAsFactors = F)


#' ### Create columns with proportions
chlorophyll$trtpro <- chlorophyll$treatment_final / chlorophyll$treatment_initial
chlorophyll$cntrpro <- chlorophyll$control_final / chlorophyll$control_initial

#' ### Calculate chlorophyll damage using proportions
chlorophyll$chlp_tolerance <- 1 - (chlorophyll$cntrpro - chlorophyll$trtpro)

# write.csv(x = chlorophyll, file = "data/chlorophyll_inv_calc.csv")


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
t.test(chlorophyll$chlp_tolerance ~ chlorophyll$location)


#' ## Create boxplot for north and south
chl_boxplot <- ggplot(chlorophyll, aes(location, chlp_tolerance))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Chlorophyll Stability")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
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





#' ## Analysis without Tremp
noTremp <- chlorophyll[1:48,]

plot(density(noTremp$chlp_tolerance), 
     main="Chlorophyll Data - All", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(chlorophyll$chlp_tolerance), 2)))
#' ## T-test analyzing chlorophyll heat damage in north and south populations
t.test(noTremp$chlp_tolerance ~ noTremp$location)

#' ## Create boxplot for north and south
noTrempNS_boxplot <- ggplot(noTremp, aes(location, chlp_tolerance))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Chlorophyll Stability")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(noTrempNS_boxplot)

#' ## Boxplot for all populations
noTremp_boxplot <- ggplot(noTremp, aes(x= fct_reorder(population,chlp_tolerance), chlp_tolerance))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Chlorophyll Damage")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(noTremp_boxplot)
                  
png(filename = "figures/chpl_noTremp.png", width = 300, height = 300, units = "px")
plot(noTrempNS_boxplot)
dev.off()



#' # Outliers!!
test <- grubbs.test(noTremp$chlp_tolerance)
test

# install the package 
install.packages("ggstatsplot")
# Load the package
library(ggstatsplot)
# Create a boxplot of the dataset, outliers are shown as two distinct points
boxplot(data = noTremp, chlp_tolerance~location)$out
outliers <- boxplot(data = noTremp, chlp_tolerance~location, plot=FALSE)$out         
noTremp_noOutliers<- noTremp[-which(noTremp$chlp_tolerance %in% outliers),]

#' ## T-test analyzing chlorophyll heat damage in north and south populations without outliers
t.test(noTremp_noOutliers$chlp_tolerance ~ noTremp_noOutliers$location)

#' ## arcsine sqrt transformation for later t-test
noTremp_noOutliers$arcsintran <- asin(sqrt(noTremp_noOutliers$chlp_tolerance))
#' ## arcsin sqrt transformation t-test
t.test(noTremp_noOutliers$arcsintran ~ noTremp_noOutliers$location)

#' ## Create boxplot for north and south
noTrempNS_noOutliers_boxplot <- ggplot(noTremp_noOutliers, aes(location, chlp_tolerance))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_classic() +
  ylab("Chlorophyll Stability")+ 
  xlab("") +
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(noTrempNS_noOutliers_boxplot)

png(filename = "figures/chpl_noTremp_noOutliers.png", width = 400, height = 400, units = "px")
plot(noTrempNS_noOutliers_boxplot)
dev.off()
