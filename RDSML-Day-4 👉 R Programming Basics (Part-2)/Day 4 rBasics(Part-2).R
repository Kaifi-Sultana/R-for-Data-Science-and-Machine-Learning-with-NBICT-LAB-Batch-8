# Data Types in R
# 1. Numeric - Integer / Floating Point
# 2. String - "Kaifi Sultana" / 'Kaifi Sultana'
# 3. Logical 

a = 11 # Ctrl+enter to declare variable and store it
b = 7.19
class (a)
class (b)

name = 'Kaifi Sultana'
print (name)
class (name)

c = "52"
# print(c + 9)
print (a + 9)
class (c)

# Logical Data Type - TRUE, FALSE (T, F)
a > b
class (a > b)
print (a < b)
x = 19
y = 22-3
print(x == y)
print(x != y)
print(y > x)
print (y >= x)

# Logical Operators in R
# && Logical Operator #and operator result only comes true when both sides true, otherwise false
# || Logical Operator #or operator result is always true unless both sides are false

4 == 4 && 5 == 5
x != y || x == y

# Simple Mathematical Operators in R
z = 6 + 9 - 8 * 2 / 3
print(z)
z = 6 + 9 - 8 * (2 / 3)
print(z)

w = 4 + 3 -3 * (2 / 3)
print(w)
w = (4 + 3 -3) * (2 / 3)
print(w)

y = 4 ^ 3
print(y)

11/5
11%%5 # modulo operator
11 %/% 5 # division result without fraction or floating
