# Factors in R
# Summary of numeric items
participants_age = c(78, 25, 68, 45, 48, 36)
summary(participants_age)
# Mean, median, minimum number, max number are identified. Number statistics is visualized.

#Finding summary of characters
profession = c("Doctor", "Teacher", "Teacher", "Businessman", "Teacher")
summary(profession)
# Need to convert the vector into factor, to identify the number/frequency of each profession.

profession = factor(profession)
summary(profession)

# Putting the summary in order
Birth_month = c("Jan", "Dec", "Apr", "Aug", "Jan", "Mar", "Jun", "Apr", "Jul", "Aug", "Sept", "Apr", "Oct", "Jul", "Sept")
summary(Birth_month)

Birth_month = factor(Birth_month)
summary(Birth_month)
# output appears in alphabetical ascending order. but we want it to be in monthly order. To declare the order for R, levels command is used.
Birth_month_fact = factor(Birth_month, 
                     ordered = TRUE, 
                     levels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"))
summary(Birth_month_fact)


#Lists in R
# Lists are used to place number of items in a bundle
a = c(2,4,7)
b = c("red","green","blue")
c = "Welcome!"

my_list = list(a,b,c)
# if we call this list, all the items will be displayed in output.
my_list

# Naming the list items
my_list = list(Participants = a, Colors = b, Message = c)
my_list


# Calling a specific data structure/ all items from the list
# calling by using the number signs
my_list[1]
my_list[2]
my_list[3]
# calling by the name of list item
my_list["Colors"]
# another way of calling
my_list$Colors

# calling specific items from the data structure
my_list$Colors[2]
my_list$Participants[3]
