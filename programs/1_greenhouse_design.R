#' #Randomization for greenhouse experimental design

remove(list=ls())
set.seed(654841)


#' Randomization for ramet A for all plants
(A_north <- sample(x = 1:20, size = 20, replace = F))
(A_south <- sample(x = 1:20, size = 20, replace = F))

#' Coin flip for which position(left or right) to place northern plant
A_placement <- sample(x = c("left", "right"), size = 20, replace = T)

A_ramet <- data.frame(A_north, A_south, A_placement)


#' Randomization for ramet B for all plants
(B_north <- sample(x = 1:20, size = 20, replace = F))
(B_south <- sample(x = 1:20, size = 20, replace = F))

#' Coin flip for which position(left or right) to place northern plant
B_placement <- sample(x = c("left", "right"), size = 20, replace = T)

B_ramet <- data.frame(B_north, B_south, B_placement)


#' Randomization for ramet C for all plants
(C_north <- sample(x = 1:20, size = 20, replace = F))
(C_south <- sample(x = 1:20, size = 20, replace = F))

#' Coin flip for which position(left or right) to place northern plant
C_placement <- sample(x = c("left", "right"), size = 20, replace = T)

C_ramet <- data.frame(C_north, C_south, C_placement)


#' Randomization for ramet D for all plants
(D_north <- sample(x = 1:20, size = 20, replace = F))
(D_south <- sample(x = 1:20, size = 20, replace = F))

#' Coin flip for which position(left or right) to place northern plant
D_placement <- sample(x = c("left", "right"), size = 20, replace = T)

D_ramet <- data.frame(D_north, D_south, D_placement)



All <- data.frame(A_ramet, B_ramet, C_ramet, D_ramet)
write.csv(file = "Output/greenhouse_design.csv", x = All)
