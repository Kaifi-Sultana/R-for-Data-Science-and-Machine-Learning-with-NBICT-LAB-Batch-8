# Matrix in R - two dimensional data structure
# two vectors are created below
study_hours = c(89,69,45,75,63,54,23,25,57,46)
subject_marks = c(79, 53, 71, 57, 63, 54, 74, 77, 61, 69)

# matrix can be made by each vector separately, or combining the vectors.

# Creating a matrix by just using study_hours
stu_hours_matrix = matrix(study_hours)
stu_hours_matrix

# If we only want to see the vector in the console
study_hours


# Joining two columns in a matrix
student_data = c(study_hours, subject_marks)
# we can see the student data in the console, the output is just combined in a single row.
student_data

student_matrix = matrix(student_data)
student_matrix
# the output is showed in a single column now. in this case byrow = TRUE
# now we want to split the two data sets, each with 10 input in two separate columns
student_matrix = matrix(student_data, byrow = FALSE, nrow = 10)
student_matrix

# Naming rows and columns in a matrix
colnames(student_matrix) = c('Study_Hours', 'Subject_Marks')
student_matrix
# the console output shows the newly added column names as headings.

# adding row names
rownames(student_matrix) = c(1:10)
student_matrix
# the console output shows the matrix with both row and column names. 

# selecting an element from matrix first number indicates row, second one column
student_matrix[4,1]
student_matrix [5,2]

# To see the summary of the matrix
summary(student_matrix)
# summary of a matrix is well organized. just vector or variable summary is not like that.
summary (student_data)

# Data Frames in R
student_names = c('Mr.1', 'Ms.2', 'Ms.3', 'Mr.4', 'Ms.5')
# variable name must always be different, otherwise previous data is replaced.
study_hours.part2 = c(20, 24, 46, 62, 22)
marks = c(40, 55, 69, 54, 45)
gender = c('male', 'female', 'female', 'male', 'female')

# we need to show R that gender vector is categorical 
male = c(TRUE, FALSE, FALSE, TRUE, FALSE)

# naming the data frame
stu_data = data.frame(student_names, study_hours.part2, marks, gender)
summary(stu_data)

stu_data = data.frame(student_names, study_hours.part2, marks, male)
summary(stu_data)

# we could have used matrix, but matrix typically works with numerical data.
# string or logical or character type data are used in Data Frame

# finding a particular element from data set
stu_data$study_hours
# finding the mean from the above data
mean(stu_data$study_hours)
# mean is showed in console 