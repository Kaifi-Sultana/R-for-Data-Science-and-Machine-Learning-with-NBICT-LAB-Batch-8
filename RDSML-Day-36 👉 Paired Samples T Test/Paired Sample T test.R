# Paired Samples T test
# ONLY for quantitative data, must be the same sample sets to compare diff outcomes (paired data)
# In case ordinal/qualitative data, the non-parametric equivalent of Paired sample T test,
# Wilcoxon signed-rank test will be applied.

# Difference between the paired data must be in normal distribution,
# with no outlier or extreme point. Otherwise result will not be credible enough.


# In the practice dataset, same people are tested with carb and carb+protein supplement

# Importing the dataset
mydataset <- read.csv("paired-samples-t-test.csv")

# calculating the difference
diffs <- mydataset$carb - mydataset$carb_protein

# Checking if the differences are normally distributed.
shapiro.test(diffs)

# p value > 0.05, so normally distributed.

# Checking for outliers, using box plot.
boxplot(diffs)

# star marked outliers must be removed from the dataset. or Wilcoxon test is done.
# circle shaped outliers (not extreme), can be considered or removed.
# If included, it should be reported as a formality. 

# Running the Paired Samples T-test
t.test(x = mydataset$carb,
       y = mydataset$carb_protein,
       paired = TRUE)

# Null hypothesis for this dataset, no diff between means of carb and carb_protein consumers.
# so, mean diff is not significantly different than 0
# P value is lower than 0.05, null is rejected.
# Here, mean diff is 0.1355, which is not equal to 0. 
# Therefore, there is a significant difference in the running capacity,
# between carb and carb+protein consuming athletes. 
# t value is negative as we calculated carb-carb+protein, sign is trivial here. 

# If the Paired t test requirements are not fulfilled,
# e.g. data not in normal distribution or ordinal type,
# or with too many outliers that cannot be skipped,
# Running the Wilcoxon signed-rank test
wilcox.test(x = mydataset$carb,
            y = mydataset$carb_protein,
            paired = TRUE)

# Limitation is Wilcoxon cannot work with tied data (same effects before and after any change) or zero

# For APA style reporting, mean and sd of the paired data is needed.
# Calculating mean and sd
mean(mydataset$carb)
sd(mydataset$carb)

mean(mydataset$carb_protein)
sd(mydataset$carb_protein)

# Effect size is imp in reporting for higher studies.

# Effect size calculation using Cohen's d
# Effect size 0.2 ~ small, 0.5 ~ medium, 0.8 ~ large

# install.packages("effsize")
library(effsize)
cohen.d(mydataset$carb_protein, mydataset$carb, paired = TRUE)

# effect size less than 2, negligible.

# Writing style in brief

# A paired samples T test was used to determine whether there was a
# statistically significant mean difference between the distance ran
# when participants imbibed a carbohydrate-protein drink, compared to 
# a carbohydrate only drink. No outliers were detected. 
# The assumption of normality was not violated, as assessed by the
# Shapiro-wilk's test where p = 0.780. Participants ran further when imbibing the
# carbohydrate-protein drink (Mean = 11.302 KM, SD = 0.726 KM), a statistically
# significant mean increase of 0.135 KM, 95% confidence interval (CI) [0.091, 0.181],
# t(degrees of freedom 19) = 6.352, p < 0.001, Cohen's d estimate: 0.187
# The following box plot was established to visualize the differences in the dataset

# QQ plot can also be prepared, better to understand normal distribution and 
# presence of outliers.

# For large datasets, histogram of the differences can be prepared. 
