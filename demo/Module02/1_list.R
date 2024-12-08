# create a name card, with name, phone number and email address
john <- list(
  name = "John",
  phone_number = c(2, 0, 6, 1, 2, 3, 1, 2, 3, 4),
  email = "john@gmail.com"
)

# peek into the list
str(john)

# type of the list
typeof(john)

# access element(s) in the name card
john["name"]
john[["name"]]
john$name
john[[1]]

# change john's email address
john[["email"]] <- "john@uw.edu"

# remove John's phone number
john[["phone_number"]] <- NULL

# list of lists
lucy <- list(
  name = "Lucy",
  phone_number = rep(0, 10L),
  email = "lucy@uw.edu"
)

contacts <- list(
  john = john,
  lucy = lucy
)

# length
length(contacts)
length(lucy)

# lapply
lapply(contacts, function(x) x$name)

# unlist
john_vec <- unlist(john)
lucy_vec <- unlist(lucy)

# names
names(contacts)
names(contacts) <- c("contact1", "contact2")
str(contacts)


