# Things we need to identify,
# 1st Simple main effect, between fertilizer and yield.
# 2nd simple main effect, between irrigation and yield..
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
ggplot(summs, aes(irr, mean, group = fert))+
  geom_line() +
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width = .2)+
  facet_wrap(~fert, nrow = 1) +
  labs(x="Irrigation", y="Mean yield",
       title="Interaction of Fertilizer vs Irrigation") +
  theme_classic(base_size = 12)

# In Two-way ANOVA, we want to know if there  is any sig diff among the group means
# of 2 sample group means (fertilizer and irrigation) and
# if any sig interaction effect between fert and irr is there.

# Fit the model
m <- aov(y ~ fert+irr+fert*irr, data=d)
summary(m)

# From the p-value and level of significance, it can be predicted that 
# dependent variable y (yield) depends on fertilization and irrigation.
# Since p value is less than 0.05, (even less than 0.001), it can be predicted
# that one group is statistically significantly diff from at least one group.
# However, which group is diff from which one, that can be determined by post-hoc test.

# degrees of freedom (Df), residuals, F value and p value are usually included in report.
# Residual Df is, sample size - no. of cells. In this dataset, n = 120, cells=6.
# Cells are -> ctrl (high, low irr), Nitrogen (high, low irr), N+P (high, low irr)
# Interaction between fert and irr is not significantly diff (p > 0.05). 
# It means that fert and irr independently influence yield or production.
# High or low irrigation does not change the effect of fertilizer and vice versa.

# Assumptions to be maintained before post-hoc test:
# Homogeneity of variance, normal distribution of residuals

#Assumptions visual checks
par(mfrow=c(2,2))
plot(m)
par(mfrow=c(1,1))

# From the Q-Q residuals plot, normally distributed data can be predicted
# if the data are closely dispersed along the diagonal line.
# Scale Location and Constant Leverage plots indicate if homogeneity of
# variance is maintained. the horizontal line across the plot will be straight or
# close enough if it is maintained. 

# Statistical test to check normal distribution 
# Shapiro-Wilk on residuals (normality)
# residual value = yield - corresponding mean
res <- residuals(m)
shapiro.test(res)

# p-value is greater than 0.05 (0.5848), data normally distributed.
# If not and we need to try Two-way ANOVA, data must be transformed.

# Levene's test for equal variances
library(car)
leveneTest(y ~ fert*irr, data=d, center=median)

# p value greater than 0.05, therefore no sig diff in variances
# Homogeneity of variance is maintained. 

# Missing value in the dataset can be replaced by using the mean value of remaining cells.
# Better to remove the entire data row with outliers. 

# Interaction contrasts (simple effects):
# Effect of fertilizers at each irrigation level(high and low)
library(emmeans)
contrast(emmeans(m, ~ fert|irr, method="pairwise", adjust="tukey"))

# In high irr, sig diff is present between ctrl and N effect, while no sig diff 
# between N and N+P. That means farmers will be suggested to use fertilizer.
# It can be either N or N+P. Same is seen for low irr.
# This is why there was no interaction effect between N and N+P.
# If p-value was less than 0.05 (interaction effect present), 
# then the fertilizer with higher mean would be suggested to use.

# Effect of irrigation for each fertilizer (N, N+P)
library(emmeans)
contrast(emmeans(m, ~ irr|fert, method="pairwise", adjust="tukey"))

# sig diff is present between high and low irrigation level.
# sig diff is present in high and low for both N and N+P.
# So, regardless of the type of fertilizer used, high irr will get higher yield.

# Main-effect comparisons (only if interaction is negligible):
contrast(emmeans(m, ~fert), method="tukey")

# Sig diff is present between the means of ctrl and N groups
# Same observed for the means of control and N+P groups. 

# Checking for sig diff within means of irrigation levels when fert is negligible:
contrast(emmeans(m, ~irr), method="tukey")

# Sig diff is present between high and low irr levels.

# Determining which group is sig diff than which one by Lettering
# CLD Letters
library(multcomp)
# install.packages("multcompView")
library(multcompView)
group_letters <- cld(emmeans(m, ~ fert * irr), Letters = lsetters)
print(group_letters)

# By lettering, we can identify sig diff between any 2 groups. 