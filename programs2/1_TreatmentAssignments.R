########################################################
# Randomization for the ramet that will be placed in the heat treatment
# Emma Chandler
# 01/11/2022
########################################################


remove(list=ls())
set.seed(758924)


GENETS <- read.csv("Output/PlantIndex.csv", header = TRUE)


GENETS$Treatment_RametA <- sample(2, size = nrow(GENETS), replace = TRUE)

GENETS$Treatment_RametA<-replace(GENETS$Treatment_RametA, GENETS$Treatment_RametA == 1, "Heat")
GENETS$Treatment_RametA<-replace(GENETS$Treatment_RametA, GENETS$Treatment_RametA == 2, "Control")

GENETS$RametA <- sample(52, size = nrow(GENETS), replace = FALSE)
GENETS$RametB <- sample(52, size = nrow(GENETS), replace = FALSE)


write.csv(file = "Output/TreatmentAssignment_2.csv", x = GENETS)
