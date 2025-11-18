# Simple Linear Regression

# Importing the dataset
dataset <- read.csv("Salary_Data.csv")

# Salary dependent and years of experience independent variable
# Simple linear regression: Prediction of only one dependent variable's value, 
# based on only one independent variable's value.
# Independent variable/explanatory variable/feature.
# Dependent variable also called outcome variable. 
# Both variables must be in quantitative/scale measurement data.

# Training set and Test set will be created. 
# Training set: randomly selected data to train the machine learning model
# Test set: rest of the data that will be tested with the newly built
# machine learning model. 
# Majority of the data kept in training set usually.
# Accuracy score: to verify the actual and predicted value.

# Splitting the dataset into training set and test set
# install.packages("caTools")
library(caTools)

split <- sample.split(dataset$Salary, SplitRatio = 2/3)
split

# In this way, the dataset is split randomly. Every time the
# program is run, different training and test set will be created.
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
split

# We need to clarify that training test will contain TRUE values
# and test set will contain FALSE marked values
Training_set <- subset(dataset, split == TRUE)
Training_set

Test_set <- subset(dataset, split == FALSE)

# Until this point, we did data pre-processing. 

# Fitting Simple Linear Regression model to the training set
# The model is named "regressor", that will be trained up. 

Regressor <- lm(formula = Salary ~ YearsExperience, 
                data = Training_set)
