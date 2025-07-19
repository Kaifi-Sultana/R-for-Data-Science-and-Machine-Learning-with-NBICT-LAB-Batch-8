# Demonstration of Central Limit Theorem

# Generate 10,000 numbers of uniform distribution
r <- runif(10000)

# Creating a Histogram
hist(r)

# calculating the mean of r,
# it would be around 0.5 as the numbers are randomly generated from 0 to 1

meanr <- mean(r)
sdr <- sd(r)

# Draw three random samples from the distribution
samples1 <- sample(r, 4)
samples2 <- sample(r, 4)
samples3 <- sample(r, 4)

mean(samples1)
mean(samples2)
mean(samples3)

# Run a for loop
# cl4 = calculate 4 samples from r=10,000 values

cl4 <- mean(sample(r,4))

# We want to calculate sampling mean of 1000 values 
# by using the for loop

for (i in 1:1000) {
  cl4 <- c(cl4, mean(sample(r,4)))
}

hist(cl4)

# If we want to draw 100 values from the 10,000
cl100 <- mean(sample(r,100))

for (i in 1:1000) {
  cl100 <- c(cl100, mean(sample(r,100)))
}

hist(cl100)

# If we want exactly 1000 values in the output, it would be 1:999
cl10 <- mean(sample(r,10))

for (i in 1:999) {
  cl10 <- c(cl10, mean(sample(r,10)))
}

hist(cl10)