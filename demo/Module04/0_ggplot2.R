library("data.table")
library("ggplot2")

# scatter plot
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point()

# bar plot
ggplot(iris, aes(x = Species)) +
  geom_bar()

ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  geom_col()

# box plot
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot()

# line plot
mod <- lm(Sepal.Width ~ Sepal.Length, iris)
print(summary(mod))

iris_pred <- setDT(copy(iris))
iris_pred[, sepal_width_fit := predict(mod, iris)]

ggplot(iris_pred, aes(x = Sepal.Length)) +
  geom_point(aes(y = Sepal.Width, color = Species)) +
  geom_line(aes(y = sepal_width_fit))

# line with uncertainty
iris_pred <- setDT(cbind(iris, predict(mod, iris, interval = "confidence")))
setnames(
  iris_pred,
  c("fit", "lwr", "upr"),
  c("sepal_width_fit", "sepal_width_lwr", "sepal_width_upr")
)

ggplot(iris_pred, aes(x = Sepal.Length)) +
  geom_point(aes(y = Sepal.Width, color = Species)) +
  geom_line(aes(y = sepal_width_fit)) +
  geom_ribbon(aes(ymin = sepal_width_lwr, ymax = sepal_width_upr), alpha = 0.5)
