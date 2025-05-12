# Vector is a type of data structure. numeric, logical, character are data types

# Vectors in R

# Creating a vector using the c() command
student.height = c(60, 69, 55, 62) # dot or underscore is used between variables
student.height

# Checking the class of the vector student.height
is.numeric(student.height)
is.logical(student.height)

# R automatically converts numeric to text, 
# when we have a text item in the vector
b = c(5,8, 2, "sv")
b
is.numeric(b)
is.character(b)

# Conversion of data types
# For example, from numeric to character
a = c(1, 2, 3, 4 ,5)
a
class(a)
is.numeric(a)
a = as.character(a)
a
class(a)

# Logical Operator TRUE or FALSE when converted to numeric, TRUE converts to 1,
# and FALSE converts to 0
d = c(TRUE, FALSE, FALSE, TRUE, FALSE)
d = as.numeric(d)
d
class(d)

# Another way, when converting numeric to logical, 1 or any other number converts to TRUE 
#and numeric 0 converts to FALSE. 
d
class(d)
# we are defining the new d as logical d now
d = as.logical(d)
d
class(d)

# If another vector is there with other values other than 0 and 1
e = c(1, 0, 0, 1, 0, 23, -7, 0)
e = as.logical(e)
e
# output will be TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE

# Creating sequential vector 
# Creating a vector starting from 1 to 10
my_seq = c(1:10)
my_seq
my_seq = c(1:100)
my_seq
# The square/third bracket values of the output depends on the screen's zoom level.
# and it denotes ITEM Number, we can identify item number from an output value without manually counting.
my_seq2 = c(1:50, 80, 99, 88, 71, 84, 77, 61, 92, 94)
my_seq2

# Creating a sequential vector using the seq() function
new_seq = c(seq(1,10))
new_seq

# Sequence in steps of 3, using 'by' to jump in sequence
new_seq = c(seq(1, 10, by=3))
new_seq

# Vectors can have character
names = c("Elias", "Mahfuza", "Ashraf", "Fossil")
names
class(names) # to identify the class, this will be character
names[3]
names [4]
names [2:4] # square bracket is used to declare a range and find specific item 

# Assigning names to vector values
my_values = c(4, 7, 9, 11)
names(my_values) = c("a", "b", "c", "d")
my_values
my_values ["c"]
