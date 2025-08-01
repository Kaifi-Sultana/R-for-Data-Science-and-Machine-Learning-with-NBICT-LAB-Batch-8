# Need to install the visualize package

# install.packages("visualize")
library(visualize)

# Visualizing normal distribution
# Recalling the pnorm function at first
pnorm(-1.96)

# output provides the probability of the given z value.
# -1.96 means the probability will be shown on the left side of the mean/ curve.
# probability is 2.5% on either side, covering 99.7% data under the curve.
# pnorm function always gives the left side value. (1 - pnorm) output will be the rest of the curve.

visualize.norm(stat = -1.96)

# stat is the cut point, up to which the p will be calculated.
# if we want to visualize the probability of the z value
# on the upper/right side of the mean (curve)

visualize.norm(stat = 1.96, section = "upper")

# If we want to visualize 95% data under the curve, 
visualize.norm(stat = c(-1.96, 1.96), section = "bounded")

# If we want to exclude the middle part and visualize both tails,
visualize.norm(stat = c(-1.96, 1.96), section = "tails")

# If we want to visualize 68% data under the curve where sd is -1 and 1, 
visualize.norm(stat = c(-1, 1), section = "bounded")

# If we want to visualize 99.7% data under the curve where sd is -3 and 3,
visualize.norm(stat = c(-3, 3), section = "bounded")

# If we want to know the probability outside of the abovementioned region,
# where z <= -3 and z >= 3
visualize.norm(stat = c(-3, 3), section = "tails")

# With the visualize package, we can calculate the probability of any z value.

# In a given scenario, if the mean age of the individuals in a data set is 75,
# sd 1, then calculate the probability of the persons with age 77 or more?
# we can do this with z formula and z table manually. However, by using pnorm in R,
# the z value is 2 if we calculate manually with formula.
pnorm(2)

# here pnorm gives the value on the left side of the bell shaped curve,
# indicating the values which are less then 77. Therefore,

1 - pnorm(2)

visualize.norm(stat = 77, mu = 75, sd = 1, section = "upper")

# probability is 0.0228 or 2.28% 

# If we want to the p of having the age less than 77 years,
visualize.norm(stat = 77, mu = 75, sd = 1, section = "lower")

# probability is 0.977 or 97.7% 

# If we want to calculate this by using pnorm function,

pnorm(77, mean = 75, sd = 1)

# pnorm will show the default left side values, 
# indicating the portion of the curve which is less than 77.
# we need to minus the obtained value from 1, to get the p of being 77 or more.

1 - pnorm(77, mean = 75, sd = 1)
