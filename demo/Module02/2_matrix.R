# create a matrix
m1 <- matrix(1:9, ncol = 3)

m1 <- 1:9
dim(m1) <- c(3, 3)

nrow(m1)
ncol(m1)
dim(m1)

# access elements in a matrix
# access a row
m1[2, ]

# access first and second row
m1[c(1, 2), ]

# access a column
m1[, 1]

# access 6th element
m1[6]

# access the entir matrix
m1
m1[]

# assign values
m1 <- 0
m1[] <- 0

m1[1, ] <- 1

# matrix vector multiplication
vec <- c(1, 2, 3)
m1 %*% vec
