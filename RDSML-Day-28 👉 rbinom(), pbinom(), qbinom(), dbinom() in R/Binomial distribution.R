# Explaining rbinom()
# rbinom(n, size, prob) generate random numbers from a binomial distribution
# Here:
# n: Number of random variables to generate
# size: Number of trials in each binomial experiment
# prob: Probability of success in each trial

rbinom(n = 10, size = 1, prob = 0.5)

# Here:
# 10 --> Number of random values to generate (n=10)
# 1 --> Number of trials in each binomial experiment (size=1)
# 0.5 --> probability of success on each trial (prob=0.5)

rbinom(n = 10, size = 5, prob = 0.5)

#Explaining pbinom()
# pbinom gives the cumulative probability of getting q or fewer number of 
# successes in a binomial distribution.
# Syntax: pbinom(q, size, prob)
# Here:
# q: Number of successes
# size: number of trials
# prob: Probability of success on each trial.

pbinom(q = 5, size = 10, prob = 0.5)

# The result/output indicates that there's about 62.3%
# chance of getting 5 or fewer successes in 10 trials.

# e.g. if we flip a coin 10 times, and coming head is considered success,
# what is the probability of getting 5 or fewer heads in 10 fair coin toss/flipping. 

# You toss a coin 5 times. What is the probability of getting exactly 3 heads?
pbinom(q = 3, size = 5, prob = 0.5)

# here, we have got the answer of prob of getting 3 or fewer heads
# but not exactly 3 heads. However,
# if we subtract the prob of getting 2 heads,

pbinom(q=3, size=5, prob=0.5) - pbinom(q=2,size=5, prob=0.5)

# Explaining qbinom()
# What is the smallest number of successes "X" in 10 trials,
# (with 50% success chance in each trial), 
# such that the prob of getting "X" or fewer successes is at least 30%?

qbinom(p=0.30, size=10, prob=0.5)

# The output 4 indicates that if a coin is flipped 10 times,
# and we want to get at least 30% successes,
# we expect that head will appear at max 4 or fewer times.

# p=0.3 --> cumulative probability (30%)
# size=10 --> number of trials (e.g., 10 fair coin tosses)
# prob=0.5 --> probability of success

# Explaining dbinom()
# Calculating the probability of getting exact number of success
dbinom(x=3, size=5, prob=0.5)

# A multiple-choice quiz has 10 questions, each with 4 choices (only one correct).
# If a student guesses on every question, what is the probability of getting exactly 3 correct answers?
dbinom(x=3, size=10, prob=0.25)

# dbinom (x, size, prob)
# x=3 --> number of successes you want
# size=10 --> number of independent trials
# prob=0.25 --> probability of success in each trial
