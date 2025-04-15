#task 1 - Sadaf Fazeli

install.packages("tidyverse")
library(tidyverse)
renv::install(c("ggplot2", "dplyr", "tidyr"))
library(ggplot2)
library(dplyr)
library(tidyr)
renv::snapshot()
data(iris)
head(iris)
summary(iris)
str(iris)
df <- tbl_df(iris) 
df


#Modify the data similar to the example provided



# Filter rows with filter()
# here df is the object where we had store our tibble data
# yes, you need to use ==
filter(df, Species == "versicolor")



# Comparisons
filter(df, Petal.Length > 2)


# Logical operators
filter(df, Petal.Length > 6 & Sepal.Length > 7)




# arrange by sepal length then petal width. Default is ascending order. 
arrange(df, Sepal.Length, Petal.Width)



# allows to arrange in descending order. 
arrange(df, desc(Sepal.Length))


# from iris data, lets select only three columns - Species, Petal width and Petal length
select(df, Species, Petal.Width, Petal.Length)



mutate(df, log.Sepal.length = log(Sepal.Length))




# find mean of peteal length
summarise(df, mean(Petal.Length))




# find mean of petal length for each species

group_by(df, Species) %>% count(n())



df %>% 
  group_by(Species) %>%
  summarise(mean(Petal.Length))




#1 Scatter PLot
ggplot(data=df, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")






# 2) Box Plot

box <- ggplot(data=df, aes(x=Species, y=Sepal.Length))

box + 
  geom_boxplot(aes(fill=Species)) +
  ylab("Sepal Length") +
  ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)




# 3) Histogram
histogram <- ggplot(data=df, aes(x=Sepal.Width))

histogram +
  geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) +
  xlab("Sepal Width") + 
  ylab("Frequency") + 
  
  
  
  

# 4) bar plot
  bar <- ggplot(data=df, aes(x=Species))

bar +
  geom_bar(aes(fill=Species)) + xlab("Species") + 
  ylab("Count") +
  ggtitle("Bar plot of Sepal Length") 
  ggtitle("Histogram of Sepal Width")
  
  
  
# 5) Faceting
  facet <- ggplot(data=df, aes(Sepal.Length, y=Sepal.Width, color=Species)) +
    geom_point(aes(shape=Species), size=1.5) +
    xlab("Sepal Length") +
    ylab("Sepal Width") +
    ggtitle("Faceting") 
  # Along columns
  facet + facet_grid(. ~ Species)
  
  
  
library(annotate)  
renv::snapshot()


# Ignore R project files
*.Rproj

# Ignore R data files
*.RData
*.Rhistory



#Always add comment before commit and then push to Github
