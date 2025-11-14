# Things we need to identify,
# 1st Sample mean effect, between fertilizer and yield.
# 2nd sample mean effect, between irrigation and yield..
# 3rd is the imp part, interaction effect of fertilizer and irrigation on yield.
# If fertilization has any effect on irrigation (high/low). 

# 2 grouping variable (fertilization, irrigation), 
# with one dependent and quantitative variable (yield),
# Two-way ANOVA is used. 

# installing packages
# install.packages(c("tidyverse","car","emmeans","effectsize","performance","broom","kableExtra"))

library(tidyverse)

# Importing the dataset
d <- read.csv("cropdata.csv")

# Quick Exploratory Descriptive Statistics
summs <- d %>%
  group_by(fert, irr) %>%
  summarise(mean = mean(y), se = sd(y)/sqrt(n()), .groups = "drop")

# Quick Data Summary Visualization
library(ggplot2)
ggplot(summs, aes(irr, mean, group=fert)) +
  geom_line() +
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width=.2)+
  facet_wrap(~fert, nrow=1) +
  labs(x="Irrigation", y="Mean Yield",
       title="Interaction of Fertilizer vs Irrigation") +
  theme_classic(base_size = 12)
