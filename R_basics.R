### Introduction to R
## R is an open source programming language & software environment.
## It is used for Statistical analysis, graphical representation, 
## data analysis.
## R is simple to learn, read & write.
## It is developed by Ross Ihaka & Robert Gentleman at the University
## of Auckland, New Zealand.

# R is case sensitive

# Mathematical operators & calculations
5+6
6-5
5*6
10/5

# Print numbers in a range
1:50
50:1
print(50:1)

# Prints a specified sequence. Here 'by' is an interval.
a = seq(1,10,by=2)
print(a)

# Repeats a sequence based on the number specified in the 2nd argument.
b = rep(1,10)
b

# Assigning a variable (=) & (<-) both mean the same
a= 12
a<- 12
b<- 2
a*b

# 'ctrl + l' is used to clear the console window.

# Data types in R: Vector, List, Matrix, Array, Factor, Dataframe
# Vector : contains elements of the same class
# There are 6 type of atomic vectors, also known as 6 classes of vectors.

# 1. Logical - TRUE, FALSE (Make sure you write it in uppercase).
#               In Python the same datatype was known as Boolean.
a = TRUE
a
class(a)

# 2. Numeric - Unlike Python, In R we have all numbers 
#              be it int/float/.. classified as numeric.
a=12
a
class(a)
b=12.2
b
class(b)

# 3. Character - A string is classified as a "character". In Python we 
#                used to call string as an object.
a= "Hello"
a
class(a)

# is.numeric(),is.logical(),is.character() will check if the given
# number is numeric/logical/character and will return TRUE is yes
# and FALSE if not

a<- 12
is.numeric(a)
is.logical(a)
is.character(a)

# If the variable is a complex number, the class returned will be integer.
a<- 2L

# Unlike Python, in R we define list, tuple using the same
# curved brackets. The only difference is we specify at the 
# beginning of curved brackets whether it's a list or a tuple

#tuple --- vector---c()
#list-----list------list()

h<- list(23, 21.3, c(1,2,3),"hello")

# Indexing in R starts from [1]
h[1]
h[2]
h[[3]][1]
h[[3]][2]

# Viewing the table in different window
h<- list(23, 21.3, c(1,2,3),"hello")
View(h)


# Matrix (2 dimensional rows*columns) rectangular dataset
# It can be created by using a vector input to matrix function
# The data elements must be of the same type
# All the columns in the matrix have same type of mode
# (i.e. numeric, character, etc.) and the same length

i <- matrix(c(10,20,30),nrow = 3,ncol= 2,byrow = TRUE,
dimnames= list(c('r1','r2','r3'),c('c1','c2')))
View(i)

# c- vector/tuple - specifies values to be entered
# nrow - Total no of rows
# ncol - Total no of cols
# dimnames - Col names
# byrow = TRUE --> Travels row-wise
# byrow = FALSE --> Travels column wise

# Accessing elements in the matrix
i[3,2]
# will fetch 3rd row 2nd column

# While matrix are confined to 2 dimensions , arrays can be used 
# for multiple dimensions
? array
j <-array(c("R","Programming","Session"),dim= c(2,5,5))
j
class(j)
View(j)

# Accessing an array
j[,,4] # All rows, all columns of the 4th dimension
j[2,5,4] # "2nd row, 5th column, 4th dimension


# Factor is used to return unique values and arranges them in
# ascending order
k <- c("red","green","blue","blue","red","red" )
x <- factor(k)
x

# Dataframe
# Dataframe consists of columns with different modes of data
# It is a list of vectors of different length

m<- data.frame(gender = c('Male','Male','Female'), height = c(152, 171.5,165),
               weight = c(81, 93, 67), Age = c(42, 38, 64))
class(m)
m
# View generates a table view
View(m)
               
# Showing the values of a particular column by providing an index.
m[1]
m[3]
m$gender # Shows the column in row format.
m[[2]]   # Shows the column in row format.

# Accessing particular values via index
m$gender[3]
m[[3]][2]

# Accessing multiple items of a Dataframe
m[c(1,2)]
m[c(2,3)]
m[c(1,2),c(2,3)]

# Decision making statements in R
# If statement
# Syntax
 if (test_expression){
     statement 
}

x<- 4
if (x>0){
  print("Number is positive")
  print(x)
}

# If else statement 
# Syntax
if (test_expression){
  statement1 
} else{
  statement2
}

x<- -3
if (x>0){
  print("Number is positive")
  print(x)
} else {
  print("Number is negative")
  print(x)
}


## How to read a file in R
data = read.csv(file.choose())
View(data)
summary(data)

# Join (merge) data frames (inner, outer, left, right)
df1 = data.frame(CustomerId = c(1:6), Product = c(rep("oven",3), rep("Televison",3)))
df1
df2= data.frame(CustomerId = c(2,4,6,7),State = c(rep("California",3), rep("Texas",1)))
df2

# Merging happens based on the common column in both datasets
# Inner join
df<-merge(x=df1,y=df2,by="CustomerId")
df

# Outer (Considers all values from both dfs)
df<-merge(x=df1,y=df2,by="CustomerId",all = TRUE)
df

# Left outer join (Considers all values from left df "x")
df<-merge(x=df1,y=df2,by="CustomerId", all.x=TRUE)
df

# Right outer join(Considers all values from right df "y")
df<-merge(x=df1,y=df2,by="CustomerId",all.y=TRUE)
df


# Some default datasets in R
data("iris")
View(iris)
iris$Sepal.Length   #Here Sepal.length is the colname

data("mtcars")
View(mtcars)
mtcars$mpg

nrow(mtcars) #no. of rows in mtcars
row.names(mtcars) # row names
ncol(mtcars) # no of columns
colnames(mtcars) #column name in mtcars
names(mtcars) 
dim(mtcars) # dimensions: rows*cols
dimnames(mtcars) # DImension names row & col names

head(mtcars,10) # Top 10 observations
tail(mtcars)    # Bottom 10 observations

# Installing packages in R
install.packages("dplyr")
# Calling the library
library(dplyr)

# You can use ",",or "&" to use AND condition
#filter(df,condition)

# Extract columns 2 & 10.
mtcars[,c(2,10)] 

# Applying filter (similar to where clause in SQL)
# Filter mtcars for cyl = 8
filter(mtcars, cyl==8)
# Filter mtcars for cyl = 8 & cyl = 5
filter(mtcars, cyl==8,gear==5)
# Filter mtcars for cyl = 8 or cyl = 5
filter(mtcars, cyl==8 | gear ==5)


# Select statement
sel = select(mtcars,mpg,cyl,gear)
sel
filter(select(mtcars,mpg,cyl,gear),cyl==4)

select(mtcars,carb,mpg:disp,gear)


# Arrange : Used to sort a particular data or a column
# Syntax
# arrange(dataframe, orderby)
arrange(mtcars,cyl)
arrange(select(mtcars,cyl,gear),cyl)
arrange(select(mtcars,cyl,gear),cyl, gear)
arrange(select(mtcars,cyl,gear),desc(cyl))
arrange(select(mtcars,cyl,gear),cyl,desc(gear))

# Visualizations
data("mtcars")
View(mtcars)
plot(mtcars$mpg,mtcars$disp)
plot(mtcars$mpg,mtcars$hp)

# Histogram (Univariate)
hist(mtcars$mpg)

# Boxplot ( To identify outliers)
boxplot(mtcars$hp)

install.packages("ggplot2")
library(ggplot2)


pairs(mtcars)
pairs(mtcars[1:7])
