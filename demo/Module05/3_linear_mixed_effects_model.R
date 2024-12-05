# linear mixed effects model
# ==========================
library("lme4")
source("demo/Module05/functions.R")

# load data ---------------------------------------------------------------
data_dir <- "demo/Module05/data"
dt_iris <- fread(file.path(data_dir, "iris.csv"))

# plot data ---------------------------------------------------------------
plot_data(dt_iris)

# build model -------------------------------------------------------------
# lmer
model <- lmer(Sepal.Width ~ Sepal.Length + (Sepal.Length || Species), dt_iris)
coef(model)
vcov(model)
summary(model)

dt_iris[, sepal_width_fit := predict(model, dt_iris)]

# plot fit ----------------------------------------------------------------
plot_fit_group(dt_iris, nrow = 3)

# summarize fit -----------------------------------------------------------
performance <- get_performance(dt_iris)
