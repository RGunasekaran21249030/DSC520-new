# Assignment: ASSIGNMENT Exercise 3: Test Scores
# Name: Gunasekaran, Ragunath
# Date: 2020-09-12

## setting up the working directory to DS Folder
## Scores.csv file existing in C:\Users\ragun\Documents\GitHub\dsc520 Previous Sem\data\scores.csv
setwd("C:/Users/ragun/Documents/GitHub/dsc520-master/DSC520-new")


## Loading the scores.csv file into data frame caleld scores_df
scores_df <- read.csv("data/scores.csv",stringsAsFactors=TRUE)

## get the names of the varibales in the dataframe - scores_df
names(scores_df)
str(scores_df)
summary(scores_df)

typeof(scores_df$Count)
typeof(scores_df$Score)
typeof(scores_df$Section)

## Loading the full data frame (scores_df) into Sports, Regular based on the section
scores_Sports_df <- subset(scores_df, Section=="Sports")
scores_Sports_df   
mean(scores_Sports_df$Score)

scores_Regular_df <- subset(scores_df, Section=="Regular")
scores_Regular_df

#finding the mean of two data set for score values
mean(scores_Sports_df$Count)
mean(scores_Sports_df$Score)

mean(scores_Regular_df$Count)
mean(scores_Regular_df$Score)

library(knitr)
z = tapply(scores_Regular_df$Score, scores_Sports_df$Count, mean) 
kable(z)  
  
# plot 
library(ggplot2)
ggplot(scores_df, aes(x = Count, y = Score)) +
  geom_point()

ggplot(scores_df, aes(x = Count, y = Score, Score, shape = Section, colours = Section)) +
    geom_point()

ggplot(scores_df, aes(x = Count, y = Score, Score, shape = Section, colours = Section)) +
    geom_point()
  
ggplot(scores_df, aes(x = Section, y = Score, Score, shape = Section, colours = Section)) +
    geom_point()
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  