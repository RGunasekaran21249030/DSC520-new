# Assignment: ASSIGNMENT 7 - Exercise 11: Multiple Regression with R (Github)
# Name: Gunasekaran, Ragunath
# Date: 2020-10-12

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/ragun/Documents/GitHub/dsc520-master/DSC520-new")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")

# Fit a linear model
earn_lm <-  lm(earn ~ ed + race + height + age + sex, data = heights_df)

# View the summary of your model
summary(earn_lm)

predicted_df <- data.frame(
  earn = predict(earn_lm, heights_df),
  ed=heights_df$ed, race=heights_df$race, height=heights_df$height,
  age=heights_df$age, sex=heights_df$sex
  )

# View the summary of your model
summary(predicted_df)

## Compute deviation (i.e. residuals)

mean_earn <- mean(heights_df$earn)
## Corrected Sum of Squares Total
sst <- sum((mean_earn - heights_df$earn)^2)

## Corrected Sum of Squares for Model
ssm <- sum((mean_earn - predicted_df$earn)^2)

## Residuals
residuals <- heights_df$earn - predicted_df$earn

## Sum of Squares for Error
sse <- sum(residuals^2)

## R Squared R^2 = SSM\SST
r_squared <- ssm/sst

## Number of observations
n <- length(coefficients(earn_lm))

## Number of regression parameters
p <- 2
## Corrected Degrees of Freedom for Model (p-1)
dfm <- p-1

## Degrees of Freedom for Error (n-p)
dfe <- n-p
## Corrected Degrees of Freedom Total:   DFT = n - 1
dft <- n-1

## Mean of Squares for Model:   MSM = SSM / DFM
msm <- ssm/dfm
## Mean of Squares for Error:   MSE = SSE / DFE
mse <- sse/dfe
## Mean of Squares Total:   MST = SST / DFT
mst <- sst/dft
## F Statistic F = MSM/MSE
f_score <- msm/mse

## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
adjusted_r_squared <- 1 - ((1 - r_squared)*dft / dfe)

## Calculate the p-value from the F distribution
p_value <- pf(f_score, dfm, dft, lower.tail=F)
