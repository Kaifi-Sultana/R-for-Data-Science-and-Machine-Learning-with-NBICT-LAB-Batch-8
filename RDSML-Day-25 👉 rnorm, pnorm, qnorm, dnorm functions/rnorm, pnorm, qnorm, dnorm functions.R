# rnorm = random normal distribution
# standard normal distribution = mean 0, sd 1

# rnorm
rnorm(10)
x <- rnorm(10)
mean(x)
sd(x)

# if we want to take 1000 values
x <- rnorm(1000)
mean(x)
sd(x)
# mean close to 0 andsd will be close to 1 as values increases
# create another set (y) with mean and sd value
y <- rnorm(10, mean=100, sd=5)
mean(y)
# will be close to 100
sd(y)
# will be close to 5

# random values will be generated every time we run rnorm function.

# pnorm is used to determine the z value and corresponding probability
# pnorm intakes z value and calculates probability for that z value
# according to standard normal distribution rules.  
# At z=0, the value of probability is 0.5

pnorm(0)
pnorm(-1.96)
pnorm(-1.64)

# qnorm is the opposite of pnorm
# it intakes p value and calculates corresponding z value.

qnorm(0.5)
qnorm(0.0249979)

# dnorm, intakes z value
# calculates y-axis values against z values.
# y-axis value for z = 0
dnorm(0)

# Using dnorm to draw normal distribution
# taking random z values, using seq function,
# to set the range of values, creating the zvalues variable
zvalues <- seq(-4.0, 4.0, by = 0.1)
zvalues

#Calculating dnorm values against the z values.
# d values are the vertical values, not data values.
dvalues <- dnorm(zvalues)
dvalues

# plotting the z and d values
plot(zvalues, dvalues)

# y axis = d values, x axis = z values
