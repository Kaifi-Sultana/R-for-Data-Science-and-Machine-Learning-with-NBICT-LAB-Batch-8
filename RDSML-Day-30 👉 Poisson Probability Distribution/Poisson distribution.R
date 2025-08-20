# Discrete probability distribution, like binomial distribution
# On the other hand, normal distribution is continuous. Not discrete
# Poisson models the no. of events that occur in a fixed
# volume, space, time or distance. 

# In a call center, avg no. of calls in an hour is 5
# prob of 3 or less calls in the next hour
ppois(q=3, lambda=5)

# prob of exactly 3 calls
ppois(q=3, lambda=5) - ppois(q=2,lambda=5)

# we can also use dpois here
dpois(x=3, lambda=5)

# learn differences between binomial and poisson
# prob of getting, 0 to 5 calls
n <- seq(0,5)
n
dpois(x=n, lambda=5)

# To visualize this,
barplot(dpois(x=n, lambda=5))

# Visualizing with visualize function
library(visualize)
# prob of getting 4 or less calls, lambda = avg calls
visualize.pois(stat=4, lambda = 10)

# prob of getting 8 or less calls,
visualize.pois(stat=8, lambda = 10)

# prob of getting 8 or more calls,
visualize.pois(stat=8, lambda = 10, section = "upper")

# prob of getting 4 to 6 calls,
visualize.pois(stat=c(4,6), lambda = 10, section = "bounded")

# prob of getting 2 to 4 calls, lambda = avg calls number is 5
visualize.pois(stat=c(2,4), lambda = 5, section = "bounded")

# prob of getting exactly 3 calls,
visualize.pois(stat=c(3,3), lambda = 5, section = "bounded")

# prob of getting <2 or >4 calls,
visualize.pois(stat=c(2,4), lambda = 5, section = "tails")
