Problemset 3: Part 2
================
Kris Nichols
5/16/2018

``` r
library(tidyverse)
```

    ## ── Attaching packages ──────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 2.2.1     ✔ purrr   0.2.4
    ## ✔ tibble  1.4.2     ✔ dplyr   0.7.4
    ## ✔ tidyr   0.7.2     ✔ stringr 1.2.0
    ## ✔ readr   1.1.1     ✔ forcats 0.2.0

    ## ── Conflicts ─────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(knitr)
library(keras)
library(modelr)
library(ggplot2)
set.seed(1234)
```

``` r
dataset <- dataset_boston_housing()
c(c(train_data, train_targets), c(test_data, test_targets)) %<-% dataset

mean <- apply(train_data, 2, mean)
std <- apply(train_data, 2, sd)
train_data <- scale(train_data, center = mean, scale = std)
test_data <- scale(test_data, center = mean, scale = std)



# A function allows for easier testing of multiple models
Model_1_NN <- function() {
  model <- keras_model_sequential() %>%
    layer_dense(units = 64, activation = "relu",
                input_shape = dim(train_data)[[2]]) %>%
    layer_dense(units = 64, activation = "relu") %>%
    layer_dense(units = 1)
  model %>% compile(
    optimizer = "rmsprop",
    loss = "mse",
    metrics = c("mse")
  )
}

# Indicate number of folds
k <- 10
indices <- sample(1:nrow(train_data))
folds <- cut(indices, breaks = k, labels = FALSE)
num_epochs <- 500
all_mse_histories <- NULL
all_loss_histories <- NULL

# Prepare data for Training
for (i in 1:k) {
  cat("processing fold #", i, "\n")
  val_indices <- which(folds == i, arr.ind = TRUE)
  val_data <- train_data[val_indices,]
  val_targets <- train_targets[val_indices]
  partial_train_data <- train_data[-val_indices,]
  partial_train_targets <- train_targets[-val_indices]
  model <- Model_1_NN() # Specify model
  history <- model %>% fit( #Train on val data
    partial_train_data, partial_train_targets,
    validation_data = list(val_data, val_targets),
    epochs = num_epochs, batch_size = 40, verbose = 0 # Number of epochs
    )
  mse_history <- history$metrics$val_mean_squared_error # Specify what the MSE value representnts
  all_mse_histories <- rbind(all_mse_histories, mse_history)
  loss_history <- history$metrics$val_loss
  all_loss_histories <- rbind(all_loss_histories, loss_history)
}
```

    ## processing fold # 1 
    ## processing fold # 2 
    ## processing fold # 3 
    ## processing fold # 4 
    ## processing fold # 5 
    ## processing fold # 6 
    ## processing fold # 7 
    ## processing fold # 8 
    ## processing fold # 9 
    ## processing fold # 10

``` r
average_loss_history <- data.frame(
  epoch = seq(1:ncol(all_loss_histories)),
  validation_loss = apply(all_loss_histories, 2, mean)
)

average_mse_history <- data.frame(
  epoch = seq(1:ncol(all_mse_histories)),
  validation_mse = apply(all_mse_histories, 2, mean)
)
```

Graph Model 1
-------------

``` r
ggplot(average_mse_history, aes(x = epoch, y = validation_mse)) + 
  geom_smooth() + 
  geom_line() +
  theme_classic() +
  labs(title = "Model 1 Performance", y = "Epoch", x = "MSE")
```

    ## `geom_smooth()` using method = 'loess'

![](Part_2.2_files/figure-markdown_github/unnamed-chunk-3-1.png)

Model 2: Implement Dropout Rate
-------------------------------

``` r
# For this model I add a dropout rate of .5
Model_2_NN <- function() {
  model <- keras_model_sequential() %>%
    layer_dense(units = 64, activation = "relu", input_shape = dim(train_data)[[2]]) %>%
    layer_dropout(rate = 0.5) %>%
    layer_dense(units = 64, activation = "relu") %>%
    layer_dropout(rate = 0.5) %>%
    layer_dense(units = 1)
  model %>% compile(optimizer = "rmsprop",loss = "mse",metrics = c("mse")
  )
}

# This code is reproduced from the last model which was produced thanks to the textbook
indices <- sample(1:nrow(train_data))
folds <- cut(indices, breaks = k, labels = FALSE)
all_mse_histories1 <- NULL
all_loss_histories1 <- NULL
for (i in 1:k) {
  cat("processing fold #", i, "\n")
  val_indices <- which(folds == i, arr.ind = TRUE)
  val_data <- train_data[val_indices,]
  val_targets <- train_targets[val_indices]
  partial_train_data <- train_data[-val_indices,]
  partial_train_targets <- train_targets[-val_indices]
  model <- Model_2_NN()
  history <- model %>% fit(
    partial_train_data, partial_train_targets,
    validation_data = list(val_data, val_targets),
    epochs = num_epochs, batch_size = 40, verbose = 0
    )
  mse_history <- history$metrics$val_mean_squared_error
  all_mse_histories1 <- rbind(all_mse_histories1, mse_history)
  loss_history <- history$metrics$val_loss
  all_loss_histories1 <- rbind(all_loss_histories1, loss_history)
}
```

    ## processing fold # 1 
    ## processing fold # 2 
    ## processing fold # 3 
    ## processing fold # 4 
    ## processing fold # 5 
    ## processing fold # 6 
    ## processing fold # 7 
    ## processing fold # 8 
    ## processing fold # 9 
    ## processing fold # 10

``` r
average_loss_history1 <- data.frame(
  epoch = seq(1:ncol(all_loss_histories1)),
  validation_loss = apply(all_loss_histories1, 2, mean)
)

average_mse_history1 <- data.frame(
  epoch = seq(1:ncol(all_mse_histories1)),
  validation_mse = apply(all_mse_histories1, 2, mean)
)
```

Graph Model 2
=============

``` r
ggplot(average_mse_history1, aes(x = epoch, y = validation_mse)) + 
  geom_smooth() + 
  geom_line() +
  theme_classic() +
  labs(title = "Model 2 Performance", y = "Epoch", x = "MSE")
```

    ## `geom_smooth()` using method = 'loess'

![](Part_2.2_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
# For this model I use a L2 Regulaizer of .001. Because of its success in the last part of the assignment I am interested in further investigating the L2 model -thus my choice.
Model_3_NN <- function() {
  model <- keras_model_sequential() %>%
    layer_dense(units = 64, activation = "relu",
                kernel_regularizer = regularizer_l2(0.001),
                input_shape = dim(train_data)[[2]]) %>%
    layer_dense(units = 64, activation = "relu",
                kernel_regularizer = regularizer_l2(0.001)) %>%
    layer_dense(units = 64, activation = "relu",
                kernel_regularizer = regularizer_l2(0.001)) %>%
    layer_dense(units = 1)
  model %>% compile(
    optimizer = "rmsprop",
    loss = "mse",
    metrics = c("mse")
  )
}

indices <- sample(1:nrow(train_data))
folds <- cut(indices, breaks = k, labels = FALSE)
all_mse_histories5 <- NULL
all_loss_histories5 <- NULL
for (i in 1:k) {
  cat("processing fold #", i, "\n")
  val_indices <- which(folds == i, arr.ind = TRUE)
  val_data <- train_data[val_indices,]
  val_targets <- train_targets[val_indices]
  partial_train_data <- train_data[-val_indices,]
  partial_train_targets <- train_targets[-val_indices]
  model <- Model_3_NN()
  history <- model %>% fit(
    partial_train_data, partial_train_targets,
    validation_data = list(val_data, val_targets),
    epochs = num_epochs, batch_size = 20, verbose = 0
    )
  mse_history <- history$metrics$val_mean_squared_error
  all_mse_histories5 <- rbind(all_mse_histories5, mse_history)
  loss_history <- history$metrics$val_loss
  all_loss_histories5 <- rbind(all_loss_histories5, loss_history)
}
```

    ## processing fold # 1 
    ## processing fold # 2 
    ## processing fold # 3 
    ## processing fold # 4 
    ## processing fold # 5 
    ## processing fold # 6 
    ## processing fold # 7 
    ## processing fold # 8 
    ## processing fold # 9 
    ## processing fold # 10

``` r
average_loss_history2 <- data.frame(
  epoch = seq(1:ncol(all_loss_histories5)),
  validation_loss = apply(all_loss_histories5, 2, mean)
)

average_mse_history2 <- data.frame(
  epoch = seq(1:ncol(all_mse_histories5)),
  validation_mse = apply(all_mse_histories5, 2, mean)
)
```

Graph Model 3
=============

``` r
ggplot(average_mse_history2, aes(x = epoch, y = validation_mse)) + 
  geom_smooth() + 
  geom_line() +
  theme_classic() +
  labs(title = "Model 3 Performance", y = "Epoch", x = "MSE")
```

    ## `geom_smooth()` using method = 'loess'

![](Part_2.2_files/figure-markdown_github/unnamed-chunk-7-1.png)

Final Model Graphing and Results
================================

``` r
model_selection <- bind_rows("Model 1" = average_mse_history, "Model 2" = average_mse_history1, "Model 3" = average_mse_history2, .id = "model")
model_selection %>%
  ggplot(aes(epoch, validation_mse, color = model)) +
  geom_line(show.legend = FALSE) +
  theme_classic() +
  labs(title = "Model comparison",subtitle = "Model 1: Basic Three Layer; Model 2: Dropout=.05; Model 3: RegulaizerL2 = .001",y = "MSE") +
  facet_wrap(~ model, ncol = 1) +
  ylim(10, 20)
```

    ## Warning: Removed 69 rows containing missing values (geom_path).

![](Part_2.2_files/figure-markdown_github/unnamed-chunk-8-1.png) This model seems to have the lowest MSE so I will use this as my central model.

Model 3 Results:MSE
===================

``` r
final_model <- Model_3_NN()
final_model %>% fit(train_data, train_targets,
              epochs = 175, batch_size = 20, verbose = 0)
result <- model %>% evaluate(test_data, test_targets)

print(result)
```

    ## $loss
    ## [1] 13.33949
    ## 
    ## $mean_squared_error
    ## [1] 13.09413

An MSE of 14 is fairly low and when observing the graph, fairs far better than all the other models. More experimentation can be done with reguilzation as it seems to yield the best models in each part of this assignment.
