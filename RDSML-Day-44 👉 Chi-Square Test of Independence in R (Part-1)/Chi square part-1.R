# Importing the dataset
# Dataset not in csv format. Text format.
housetasks <- read.delim("housetasks.txt", row.names =1)

# Chi square test of independence mainly used for the
# analysis of contingency or frequency table, with many categorical variables.
# However, dataset can also be different than frequency table. 

# Contingency table can be visualized by using the function, balloonplot()
# This function draws a graphical matrix where each cell contains a dot,
# whose size reflects the relative magnitude of the corresponding component.

# install.packages("gplots")
library("gplots")

# We need to convert the text structured dataset to matrix based dataset.
# Then the matrix is converted to a table.
data_table<-as.table(as.matrix(housetasks))

balloonplot(t(data_table), main = "Housetasks Visualization",
            label = F, show.margins = F, xlab = "", ylab = "")

# Another approach to visualize a contingency table - Mosaic plot
# This can be by using the function mosaicplot()
# from the built-in R package called graphics

library("graphics")
mosaicplot(data_table, shade=T, las = 2,
           main="Housetasks")

# Blue color in the plot indicates that the observed value is higher than
# the expected value. On the other hand, red color specifies that the observed 
# value is lower than the expected value. 
# Observed value = the ones in the dataset/table
# Expected value = the values where there is no sig association between
# the row and column variables. (equal)

# Chi-square is a technique to determine the sig diff between observed and expected values.

# Computing Chi-square test in R
chisq <- chisq.test(housetasks)
chisq

# Df indicates the size of dataset
# df -> (row number -1) * (column number -1) = 36 for this dataset

# p value less than 0.05. That means sig diff is present between row and column variables
# Row and column variables are not independent of one another. 

# Observed counts
chisq$observed

# Expected counts
round(chisq$expected,2)

# round is used for getting 2 decimals.
# Formula for calculating expected values: 
# column total * row total/ground total