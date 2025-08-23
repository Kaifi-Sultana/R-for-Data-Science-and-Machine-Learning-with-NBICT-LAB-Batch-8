# One Sample Z Test
# Identifying the difference between sample and population mean
# Population mean and its SD must be known here.
# Null hypothesis is sample mean = population mean

# Installing BSDA package
# install.packages("BSDA")
library(BSDA)

# Imporitng the dataset
dataset <- read.csv("Perfume.csv")
mean(dataset$Machine.1)

# when we want to know the dignificant difference between sample
# and population mean, it will be Two tailed test.

# In this dataset, population mean is given 150.
# We are determining if the sample mean (which is 152), is significantly greater
# than the population mean. This is upper tail test (one tail).
# Just the opposite, if we want to know if sample mean is
# significantly lower than population mean, that is lower tail test (one tail).
# grater or lower  = one tail, difference = two tail test.

z.test(x=dataset$Machine.1, alternative = "greater",
       mu=150, sigma.x = 2)

# x = total of all values in the dataset, mu=population mean, sigma.x=population SD.

# p value<0.05 (alpha), Null rejected. p value>0.05, Null accepted. 
# p value is the probability of accepting the Null hypothesis when it is true. 
# alpha is the cut point value at 95% confidence interval. 

# In this case, the sample mean is not equal to the population mean. 
# p value is 2.2 x 10^-16, which is way lower than the cut point value 0.05. 
# Therefore, the sample mean (152) is statistically significantly greater than the population mean (150).

# Null hypothesis is rejected. Alternative accepted. 