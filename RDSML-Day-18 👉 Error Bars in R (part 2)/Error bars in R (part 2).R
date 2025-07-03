# Working with a built-in dataset in R.
# Importing the dataset
tooth_data = ToothGrowth

# Creating a function for summarizing the data,
# based on the grouping variables.

# Packages/libraries are sum of different functions. packages must be called to be activated.

data_summary = function(data, varname, groupnames){
  require(plyr)
  
  summary_func = function(x, col){
    c(mean = mean(x[[col]]), sd = sd(x[[col]]))
  }
  
  all_summary = ddply(data, groupnames, .fun = summary_func, varname)
  data_sum = rename(all_summary, c("mean" = varname))
  return(data_sum)
}

d_summary = data_summary(tooth_data, varname = "len", groupnames = c("supp", "dose"))

# Programmer decides how many argument will be used in a function.
# Here, 3 arguments are used in the created function. 
# There will be no space between the argument names.
# The first argument in the created function is data,
# data will receive the data set that we are working on.
# The variable of the data set that is focused on, 
# is denoted as "varname", meaning variable name.
# Here, length is the variable for which we are finding,
# mean and standard deviation (of length variable).
# groupnames will denote the grouping variable. 
# plyr package is needed to avail the functionality of the function. 

# The description between the curly braces is denoted as Function body.
# summary_func is called NESTED function here,
# as is created in between another function. 
# Summary_func has 2 arguments, x denotes the dataset.
# col denotes column, to indicate the column to extract it
# and be used for analysis of mean and sd.
# ddply is the main function under plyr package here, to summarize the data.
# To activate a function, it must be called.
# This function is used to summarize data with,
# 2 grouping variables and 1 scale/numeric variable. 

# Converting 'dose' to a factor variable
d_summary$dose = as.factor(d_summary$dose)
class(d_summary$dose)

# Standard deviation of mean as error bar, with explanation.
library(ggplot2)
k = ggplot(d_summary, aes(x = dose, y = len, fill = supp)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_errorbar(aes(ymin = len - sd, ymax = len + sd), width = 0.2, position = position_dodge(0.9)) +
  theme_minimal()

# To manually change the bar colors,
k + scale_fill_manual(values = c("steelblue", "orange"))
k + scale_fill_brewer(palette = "Dark2")


# len = mean length here.

# Error bar comes from sd. 
# It gives an idea on how much the created mean bar can go upper or lower.
# the min and max value of the mean bar. 