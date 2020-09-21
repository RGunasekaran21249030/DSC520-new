# Assignment: ASSIGNMENT Exercise 5: 2014 American Community Survey
# Name: Gunasekaran, Ragunath
# Date: 2020-09-15

# point the directory to Assignment folder. so that we can point the data files.
setwd("C:/Users/ragun/Documents/GitHub/dsc520-master/DSC520-new")


#********************************* 1 & 2 ***********************************************************
# Question 1.	What are the elements in your data (including the categories and data types)?
# Question 2.	Please provide the output from the following functions: str(); nrow(); ncol()

# Load the data from csv file to data set
acs_2014 <- read.csv("Data/acs-14-1yr-s0201.csv")
str(acs_2014)
nrow(acs_2014)
ncol(acs_2014)
#**************************************************************************************************

# 3. Create a Histogram of the HSDegree variable using the ggplot2 package.
#   a. Set a bin size for the Histogram.
#   b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.

library(ggplot2)
ggplot(acs_2014, aes(x = HSDegree)) + geom_histogram()

# a. Set a bin size for the Histogram
ggplot(acs_2014, aes(x = HSDegree)) + geom_histogram(binwidth = 5)

# b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.
ggplot(acs_2014, aes(x = HSDegree)) + geom_histogram(binwidth = 5, color="blue", fill="red") + 
  labs(title = "HS Degree Analysis - Histogram", x = "Avg. HS Degrees", y="Count of HS Degrees")
#**************************************************************************************************

# f. Include a normal curve to the Histogram that you plotted.
histograms <- hist(acs_2014$HSDegree)
multiplier <- histograms$counts / histograms$density
densityvalue <- density(acs_2014$HSDegree)
lines(densityvalue)

xvalue <- seq(min(acs_2014$HSDegree), max(acs_2014$HSDegree), length.out= 100)
meanvalue <- mean(acs_2014$HSDegree)
sdvalue <- sd(acs_2014$HSDegree)
normalvalue <- dnorm(x = xvalue, mean = meanvalue, sd = sdvalue)

lines(xvalue, normal * multiplier[1], col = "blue", lwd = 2)
sd_x <- seq(meanvalue - 3 * sdvalue, meanvalue + 3 * sdvalue, by = sdvalue)
sd_y <- dnorm(x = sd_x, mean = meanvalue, sd = sdvalue) * multiplier[1]
segments(x0 = sd_x, y0= 0, x1 = sd_x, y1 = sd_y, col = "green", lwd = 2)
#**************************************************************************************************

# 5. Create a Probability Plot of the HSDegree variable
qqnorm(acs_2014$HSDegree) 
#**************************************************************************************************

# 7. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced
library(pastecs)
stat.desc(acs_2014)


