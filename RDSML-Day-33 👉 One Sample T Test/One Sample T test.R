# If population mean and population sd is not given,
# One sample Z test cannot be done. 
# When population sd is not given, one sample T test can be done.
# Data must be in normal distribution to conduct all T tests.

# Importing the dataset
myData <- read.csv("bottle_data.csv")

# Checking for normality (normal distribution)
# Shapiro-wilk Test
shapiro.test(myData$value)

# One sample T Test
t.test(x = myData$value, mu=150)
