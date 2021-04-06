############### Pollen Competition Expected Results################################

library(ggplot2)
library(dplyr)


dat <- c(rnorm(n = 50, mean = 0.75, sd = 0.1),
        rnorm(n = 50, mean = 0.35, sd = 0.1))
region <- rep("TX", 100)
Treatment <- c(rep("High Temperature", 50), rep("Low Temperature", 50))
TX <- cbind(region, Treatment, dat)

dat <- c(rnorm(n = 50, mean = 0.25, sd = 0.1),
         rnorm(n = 50, mean = 0.65, sd = 0.1))
region <- rep("MN", 100)
Treatment <- c(rep("High Temperature", 50), rep("Low Temperature", 50))
MN <- cbind(region, Treatment, dat)

alldat <- data.frame(rbind(TX, MN))


allsummary <- alldat %>% group_by(Treatment, region) %>%
  summarise(mean = mean(as.numeric(dat)),
            se = sd(dat)/sqrt(n()))



ggplot(allsummary, aes(region, mean, fill = Treatment)) +
  geom_bar( stat = "identity", position = "dodge") +
  theme_classic() +
  geom_errorbar(aes(x = region, ymin = mean - se, ymax = mean + se),
                width = 0.5, position = position_dodge(0.8)) +
  scale_fill_manual(values = c("gold3", "grey39")) +
  ylab("Proportion of Seeds Sired") +
  xlab("Region") +
   theme(text = element_text(family = "serif"),
        plot.title = element_text(hjust = 0.05, size = 20),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 12),
        axis.text.y=element_text(size=16, margin = margin(l = 15)),
        axis.title.y=element_text(size=16, margin = margin(l = 10)),
        axis.text.x=element_text(size = 16),
        axis.title.x=element_text(size = 16))

############ Great Plot resource: https://www.staringatr.com/3-the-grammar-of-graphics/bar-plots/5_finalising/ 