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
# In 95% confidence interval, this value is less than 0.05 (5%),
# thus the null hypothesis is rejected. There is significant diff in group mean
# of at least one group than the other/s, control/trtment 1/ trtment 2. 
# Which group's mean is significantly diff, post-hoc test can determine it.

# Residuals degrees of freedom -> total no. of cases - total no. of groups
# here, 30 - 3 = 27

# Post-hoc test to identify which group mean is sig diff than other/s
# Tukey multiple pairwise-comparisons
TukeyHSD(anova)

# We can see the diff between the means between control and
# treatment groups. Trt2 and Trt1 are sig diff from each other.

# Homogeneity of variances must be maintained among each group data.
# Visualizing homogeneity of variance
plot(anova, 1)

# Residual's value in the plot comes from,
# group's mean - each individual value from dataset
# In what distance the individual value is situated from the mean value
# is the residual value.These are plotted in the graph.
# Variance of residual values must not have any sig diff.

# From visual experience, homogeneity of variance (variability among the data)
# is maintained when all data are almost evenly distributed below and above 0.
# And the dotted line and solid line along 0 will be close to each other on the plot.

# Levene test to identify homogeneity of variance
library(car)
leveneTest(weight ~ group, data = PlantDataset)

# p value is 0.3412, greater than 0.05
# Null hypothesis cannot be rejected.
# Homogeneity of variance is maintained.

# When homogeneity of variance is not maintained,
# ANOVA test with no assumption of equal variances,
oneway.test(weight ~ group, data = PlantDataset)

# p value is 0.01739 is less than 0.05, that means one group mean is sig diff than the other.

# Another test when homogeneity of variance is not maintained
# Pairwise t-tests with no assumptions of equal variances
pairwise.t.test(PlantDataset$weight, PlantDataset$group,
                p.adjust.method = "BH", pool.sd = FALSE)

# Checking for normal distribution
plot(anova, 2)

# When data are close to the diagonal line in the Q-Q plot,
# they are in normal distribution. 

# Statistically identify if data are in normal distribution
# Extracting the residuals
aov_res <- residuals(object = anova)

# residual = group mean - individual value

# Shapiro-Wilk test for checking normal distribution
shapiro.test(aov_res)

# p value greater than 0.05 (0.4379),
# data normally distributed.

# If not normally distributed, nonparametric equivalent of One-way ANOVA,
# Kruskal-Wallis H test is run.
kruskal.test(weight ~ group, data = PlantDataset)

# Since p value is less than 0.05, we need to run the post hoc test for 
# Kruskal-Wallis H test (pairwise test)
pairwise.wilcox.test(PlantDataset$weight, PlantDataset$group,
                     p.adjust.method = "BH")
