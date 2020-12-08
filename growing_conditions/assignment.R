#' # Placement randomization of plants in greenhouse
#' #### West bench and east bench with three rows of plants each. Each row has 13 plants.Order of randomized numbers is the order of plants starting on the west side of west bench working from left to right.


remove(list=ls())
set.seed(15648)

#' ## Week 1
sample(x = 1:76, size = 76, replace = F)
#' ## Week 2
sample(x = 1:76, size = 76, replace = F)
#' ## Week 3
sample(x = 1:76, size = 76, replace = F)
#' ## Week 4
sample(x = 1:76, size = 76, replace = F)



#' ## Footer
#' 
# ezknitr::ezspin(file = "growing_conditions/assignment.R", out_dir = "growing_conditions/Output", fig_dir = "Figures", keep_rmd = F, keep_md = F)
