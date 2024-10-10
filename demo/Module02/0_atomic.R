# please provide three ways to create vector contains 1, 2, ..., 10
vec1 <- c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L)
vec1 <- seq(1, 10)
vec1 <- 1:10

# please select the first and third element
vec1[1:5]

# please access the values that is greater than 5
vec1[vec1 > 5]

# please assign all even number to 0
vec1[vec1 %% 2 == 0] <- 0
vec1[vec1 == 0] <- seq(2, 10, by = 2)

# remove 2nd and 5th elements
vec1[-c(2, 5)]