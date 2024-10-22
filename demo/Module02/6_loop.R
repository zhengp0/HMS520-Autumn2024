# for loop
# loop over elements
vec <- c("a", "b", "c")
for (x in vec) {
  print(x)
}

for (i in seq_along(vec)) {
  print(vec[i])
}

vec <- vector(mode = "double")
for (i in seq_along(vec)) {
  print(vec[i])
}

# sum all numbers under 20 and mod 3 == 0
sum_vec <- 0

for (i in 1:100) {
  if (i %% 3 == 0) {
    print(i)
    sum_vec <- sum_vec + i
  }
  
  if (i >= 20) {
    break
  }
}

vec <- 1:100
sum(vec[vec %% 3 == 0 & vec <= 20])
