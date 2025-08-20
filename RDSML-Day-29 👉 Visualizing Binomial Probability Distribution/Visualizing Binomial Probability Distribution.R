# Recalling last class
dbinom (x=4, size=10, prob=0.5)

# when we want to know the EXACT probability of 
# generating exactly 4 heads upon flipping a coin 10 times
# success = heads, prob of success is 0.5 (either head or tail will come)

# pbinom calculates cumulative probability
pbinom (q=4,size=10, prob=0.5)

# q = prob of 4 or less than 4 head generation
# x = prob of exactly 4 heads generation

# Calculating sequential probability
# Upon flipping a coin 10 times, the prob of generating
# exactly n number of heads each time, 0 time = no success/no head
n <- c (0:10)
n

p <- dbinom(x=n, size=10, prob=0.5)
barplot(p)

library(visualize)

# prob of exactly 4 or less than 4 heads visualization
visualize.binom(stat=4, size=10, prob=0.5, section='lower')

# cross checking with pbinom
pbinom(q=4, size=10, prob=0.5)

# prob of 4 or more than 4 heads visualization
visualize.binom(stat=4, size=10, prob=0.5, section='upper')

# prob of 4 and 6 times heads generation visualization
visualize.binom(stat=c(4,6), size=10, prob=0.5, section='bounded')

# prob of 3 or less and 7 or more times heads generation visualization
visualize.binom(stat=c(3,7), size=10, prob=0.5, section='tails')

# prob of exactly 4 generation visualization
visualize.binom(stat=4, size=10, prob=0.5)

# ^ this is for 4 or less than 4

# we need grid lines to visualize exactly 4 times heads
grid(nx=NULL, ny=NULL, col="grey",lty="dotted")

# to visualize this with visualize function,
library(visualize)
visualize.binom(stat=c(4,4), size=10, prob=0.5, section="bounded")

# in the plot, mean and SD of binomial distribution is mentioned.
# the formula can be seen in chat gpt. 