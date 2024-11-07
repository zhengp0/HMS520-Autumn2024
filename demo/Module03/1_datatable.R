# datatable exercise
# ==================
library("data.table")

data_dir <- "demo/Module03/data"
df_population <- fread(file.path(data_dir, "population.csv"))
df_death <- fread(file.path(data_dir, "death.csv"))
df_hours <- fread(file.path(data_dir, "hours.csv"))
df_pay <- fread(file.path(data_dir, "pay.csv"))

# 1. subset
# subset rows: i expression
df_death_sub <- df_death[location_id == 1]
df_death_sub <- df_death[death > 100]
df_death_sub <- df_death[(location_id == 1) & (death > 100)]

# how to filter out all rows with NA: complete.cases
df_death_sub <- df_death[complete.cases(location_id, sex_id, death)]

# subset cols: j expression, .SD + .SDcols
df_death_sub <- df_death[, c("location_id", "sex_id")]
df_death_sub <- df_death[, list(location_id, sex_id)]
df_death_sub <- df_death[, .(location_id, sex_id)]

selected_cols <- c("location_id", "sex_id")
df_death_sub <- df_death[, selected_cols, with = FALSE]
df_death_sub <- df_death[, ..selected_cols]

df_death_sub <- df_death[, .SD, .SDcols = selected_cols]

# 2. modify
# order rows: order, i expression
df_death_mod <- df_death[order(location_id, -age_group_id, sex_id)]
df_death_mod <- df_death[order(!death)]

# rename columns: j expression, setnames
df_death_mod <- df_death[, list(death_ihd = death)]
df_death_mod <- copy(df_death)
setnames(df_death_mod, "death", "death_ihd")
