# Another mehtod of inferential statistics

# Two Sample Z Test 
# population sd is known/given.
# if not, we calculate the sample sd and
# assume it to be population sd in this case.
# better to have sample size n > 30. results are more valid.

# Only difference with Two sample T test is,
# we do it when population sd is not known.

# Importing the library
library(BSDA)

# Importing the dataset
dataset <- read.csv("Perfume_Two_Sample.csv")

# Since the population sd is not directly given in this case,
# we calculate the sample sd and assume it as population sd.

machine1sd <- sd(dataset$Machine.1)
machine2sd <- sd(dataset$Machine.2)

# Running the z test
z.test(x=dataset$Machine.1, 
       y=dataset$Machine.2,
       sigma.x = machine1sd,
       sigma.y = machine2sd)

# by default it will be two tail test,
# and confidence interval 95%, alpha=0.05. if we do not specify anything.

# Output p value is far less than 0.05, 
# therefore Null hypothesis is rejected.
# "when is p is low, Null must go."

# This means that there is significant difference
# between the production size of perfume bottles of machine 1 and 2.
# even if it is 150.19 and 151.17 and mathematically not much different,
# statistically it is different. 