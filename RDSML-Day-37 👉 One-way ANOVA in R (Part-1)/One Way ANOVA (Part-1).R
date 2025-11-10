# One-way ANOVA
# Importing the dataset
PlantDataset <- PlantGrowth

# Dataset has 3 groups, control, treatment 1
# treattment 2. By One-way ANOVA, we can know if there is
# any significance diff among the group means.
# However, post-hoc test is required to know
# which particular group is diff than the other.

# One-way ANOVA is needed when there are more than 2 independent variables/groups.
# It must have 2 variables. Weight is dependent variable here. 
# If there are 2 dependent variables = 2 way ANOVA, If 3 then 3 way ANOVA.
# Dependent variable must be quantitative, not ordinal or qualitative.

# Data must be in normal distribution for each group with no outlier. 
# Homogeneity of variance must be followed. Variance of the dependent variable values
# should not have any sig diff.
# Data must be independent and non-manipulated.
# Sample size can be increased from the beginning, to avoid future data loss.

# importing the dplyr library
# install.packages("dplyr")
library(dplyr)

# Computing group means, sd and se (standard error)
# %>% = pipe operator.
stats <- PlantDataset %>%
  group_by(group) %>%
  summarise(
    mean = mean(weight),
    sd = sd(weight),
    se = sd(weight) / sqrt(n())
  )

print(stats)  

# Creating group wise box plots
boxplot(weight ~ group, data = PlantGrowth, 
        main = "PlantGrowth data",
        ylab = "Dried weight of plants", 
        col = "lightgray"
        ) 

# We can also do this by ggplot.

# Data visualization with Mean Plot
# install.packages("ggpubr")
library(ggpubr)
ggline(PlantGrowth,
       x = "group",
       y = "weight",
       add = c("mean_se", "jitter")
       )

# Running the One-way ANOVA test to determine 
# if there is any sig diff among the group means
anova <- aov(weight ~ group, data = PlantDataset)
summary(anova)

# p value, Pr (>F), is 0.0159
# In 95% confidence interval, this value is less than 0.05,
# thus the null hypothesis is rejected. There is significant diff in group mean
# of at least one group than the other/s, control/trtment 1/ trtment 2. 
# Which group's mean is significantly diff, post-hoc test can determine it.