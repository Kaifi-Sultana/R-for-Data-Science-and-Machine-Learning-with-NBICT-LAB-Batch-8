# Two sample or independent sample T test

# The given dataset has 40 participants of NBICT lab,
# 20 male and 20 female.
# Each group's test score is given and compared.
# 20 is the sample size among 500 participants.
# We want to determine if the mean of each group's score,
# show significant difference. 

# Null hypothesis is there is no significant difference.
# Alternative is the opposite. Indicates the presence of sig diff.

# Two sample Z test is not done here because,
# population sd is not known here. 
# would have been possible if we would work on all 500 participants. 
# Here only sample mean and sd can be calculated.
# Therefore, Two sample T test. The two group info is independent here.
# If the sample groups are connected, Paired sample T test is done. 
# For example, score of the same group before and after a training.
# Or effect of medication on a same group of patients. 
# The samples are connected/related in that case.

# Imporitng the dataset
dataset <- read.csv("scores.csv")

# Checking if dataset is in normal distribution
shapiro.test(dataset$Male)
# p value = 0.9787 which is greater than 0.05.

shapiro.test(dataset$Female)
# p value = 0.5568 >  0.05.
# For writing reports in APA style, AI can be used.

# We need to check for statistical similarity or diff 
# between the Variance of 2 sample groups.
# Variance = measure of dispersion of data, derived from sd.
# Here, the dispersion of obtained test scores is ca;culated.
# Two formulas are available in R for Two sample T Test.
# To determine which formula to use, variance diff must be known.

# Checking for homogeneity of variances
var.test(x=dataset$Male, y=dataset$Female)

# F test of variance declared, p-value = 0.5568 > 0.05
# Fail to reject the Null. That means no sig diff in the variances of two sample groups.
 
# Running the independent sample T test
t.test(x=dataset$Male, y=dataset$Female, var.equal = TRUE)

# ^ if true is not written, it will be taken false by fault.
# The p value = 0.02272 < 0.05
# Null rejected. There is sig diff in the calculated means of the two groups.

# For data visualization, boxplot with ggplot can be used while writing the report.

library(ggplot2)

# converting the variables from numeric to factor
dataset$Male = as.factor(dataset$Male)
dataset$Female = as.factor(dataset$Female)

# Basic box plot
ggplot(dataset, aes(x=Male, y=Female)) +
  geom_boxplot()

# need to modify the visualization code