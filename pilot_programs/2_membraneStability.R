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
set.seed(654616)

#' ### Load data
membraneStability <- read.csv(file = "data/membraneStability.csv", header = T, stringsAsFactors = F)


#' ### Create columns with proportions
membraneStability$trtpro <- membraneStability$epr_trt / membraneStability$epr_max
membraneStability$cntrpro <- membraneStability$cntr_trt / membraneStability$cntr_max

#' ### Calculate CMS using proportions
membraneStability$CMS <- ((1 - membraneStability$trtpro)/(1 - membraneStability$cntrpro)) * 100

# write.csv(x = membraneStability, file = "data/membraneStability_calc.csv")

#' ## arcsine sqrt transformation for later t-test
membraneStability$arcsintran <- asin(sqrt(membraneStability$CMS/100))

#' ## Describe data variation
#' ### Density Plot
plot(density(membraneStability$CMS), 
     main="CMS Data - All", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(membraneStability$CMS), 2))) 
#' ### Density of north and south separately
north <- membraneStability[ which(membraneStability$location=='North'), ]
south <- membraneStability[ which(membraneStability$location=='South'), ]
plot(density(north$CMS), 
     main="CMS Data - North", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(membraneStability$CMS), 2))) 
plot(density(south$CMS), 
     main="CMS Data - South", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(membraneStability$CMS), 2))) 



#' ## T-test analyzing membraneStability heat damage in north and south populations
t.test(membraneStability$CMS ~ membraneStability$location)


#' ## Create boxplot separated by north and south
CMS_boxplot <- ggplot(membraneStability, aes(location, CMS))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("CMS")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(CMS_boxplot)

#' ## Create boxplot separated by population
popCMS_boxplot <- ggplot(membraneStability, aes(x= fct_reorder(population,CMS), CMS))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("CMS")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(popCMS_boxplot)


#' Analysis without Tremp
noTremp <- membraneStability[1:48,]

plot(density(noTremp$CMS), 
     ylab="Frequency",xlab = "CMS", main = "",  
     sub=paste("Skewness:", round(e1071::skewness(membraneStability$CMS), 2)))
#' ## T-test analyzing chlorophyll heat damage in north and south populations
t.test(noTremp$CMS ~ noTremp$location)

#' ## Create boxplot for north and south
noTrempNS_boxplot <- ggplot(noTremp, aes(location, CMS))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("CMS")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(noTrempNS_boxplot)

#' ## Boxplot for all populations
noTremp_boxplot <- ggplot(noTremp, aes(x= fct_reorder(population,CMS), CMS))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Cell Membrane Stability")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(noTremp_boxplot)


#' ## Mann-Whitney U, Wilcoxon Signed Rank
wilcox.test(noTremp$CMS ~ noTremp$location) 


#' ## arcsin sqrt transformation t-test
t.test(noTremp$arcsintran ~ noTremp$location)



#' # Outliers!!
# Load the package
library(ggstatsplot)
# Create a boxplot of the dataset, outliers are shown as two distinct points
boxplot(data = noTremp, CMS~location)$out
outliers <- boxplot(data = noTremp, CMS~location, plot=FALSE)$out         
noTremp_noOutliers<- noTremp[-which(noTremp$CMS %in% outliers),]


#' ## arcsin sqrt transformation t-test
t.test(noTremp_noOutliers$arcsintran ~ noTremp_noOutliers$location)

#' ## Create boxplot for north and south
noTrempNS_noOutliers_boxplot <- ggplot(noTremp_noOutliers, aes(location, CMS))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_classic() +
  ylab("Cell Membrane Stability")+ 
  xlab("") +
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(noTrempNS_noOutliers_boxplot)

png(filename = "figures/CMS_noTremp_noOutliers.png", width = 400, height = 400, units = "px")
plot(noTrempNS_noOutliers_boxplot)
dev.off()
