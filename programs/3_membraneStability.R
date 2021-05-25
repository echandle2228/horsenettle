#######################################################################
#' # Membrane Stability data analysis
#' ## 4/8/2021
#' ## Emma Chandler
#' 
#########################################################################
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
membraneStability <- read.csv(file = "data/CMSdata.csv", header = T, stringsAsFactors = F)


#' ### Create columns with proportions
membraneStability$trtpro <- membraneStability$exp_trt / membraneStability$exp_max
membraneStability$cntrpro <- membraneStability$cntr_trt / membraneStability$cntr_max

#' ### Calculate CMS using proportions
membraneStability$CMS <- ((1 - membraneStability$trtpro)/(1 - membraneStability$cntrpro))


#' ## arcsine sqrt transformation for later t-test
membraneStability$AST_CMS <- asin(sqrt(membraneStability$CMS/100))


#' ### Averaging all ramets of same genotype
membraneStability_m<-ddply(membraneStability,.(ID),summarize, AST_CMS=mean(AST_CMS),
                     CMS=mean(CMS), location=head(location,1), population=head(population,1))


# write.csv(x = membraneStability_m, file = "data/processed/HCMS_processed.csv")




#' ### Omitting Outliers
outliers <- boxplot(data = membraneStability_m, CMS~location, plot=FALSE)$out         
membraneStability_final<- membraneStability_m[-which(membraneStability_m$CMS %in% outliers),]






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
t.test(membraneStability$AST_CMS ~ membraneStability$location)


#' ## Create boxplot separated by north and south
CMS_boxplot <- ggplot(membraneStability_m, aes(location, AST_CMS))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("Cell Membrane Stability")+ 
  xlab("") +
  theme(text = element_text(family = "serif"),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=14),
        axis.text.x=element_text(size = 14),
        axis.title.x=element_text(size = 14))
plot(CMS_boxplot)

#' ## Create boxplot separated by population
popCMS_boxplot <- ggplot(membraneStability_m, aes(x= fct_reorder(population,AST_CMS), AST_CMS))+ 
  geom_boxplot(outlier.shape=NA)+geom_jitter(width=0.2)+
  theme_bw() +
  ylab("CMS")+ 
  xlab("") +
  theme(axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.text.x=element_text(size = 12),
        axis.title.x=element_text(size = 12))
plot(popCMS_boxplot)


#' ## Mann-Whitney U, Wilcoxon Signed Rank
wilcox.test(membraneStability$AST_CMS ~ membraneStability$location) 


#' # ANOVA
anova_lmer <- lmerTest::lmer(
  formula = AST_CMS ~ varietyFactor  + (1|species) ,
  data = GH_data)
anova(rt_pbm_anova.lmer)
summary(rt_pbm_anova.lmer)


