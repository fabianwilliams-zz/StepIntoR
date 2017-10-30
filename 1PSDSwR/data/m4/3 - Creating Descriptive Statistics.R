# Creating Descriptive Statistics

# Set the working directory
setwd("C:/1FabsRepo/StepIntoR/1PSDSwR/data/m4")



# Read a CSV data file
cars <- read.csv("Cars.csv")

# Peek at the data
head(cars)

# Work with just a subset of items by doign a select
temp = select(
   .data = cars,
   Transmission,
   Cylinders,
   Fuel.Economy)

#just return whats in the filter now
head(temp)

#Apply a filter in the subset of data for just Automatic
 temp <- filter(
                .data = temp,
               Transmission == "Automatic")

#Compute a new column. This is an example of Transform
temp <- mutate(
        .data = temp,
        Consumption = Fuel.Economy * 0.425
               )

#Inspect the results
head(temp)

#do a group by
temp <- group_by(
                 .data = cars,
                 Cylinders)

#check groupby values
head(temp)


#Aggregare based on groups
temp <- summarize(
        .data = temp,
        Avg.Consumption = mean(Consumption))

#check results
head(temp)

#Arrante the rows in decending order
temp <- arrange(
                .data = temp,
                desc(Avg.Consumption))

#check results
head(temp)

#convert data back to a data frame
efficiency <- as.data.frame(temp)

#check the results for new variable efficiency
print(efficiency)

#example of method chaining by Piping in C# that is || but in R it is %>%
efficiency <- cars %>%
    select(Fuel.Economy, Cylinders, Transmission) %>%
    filter(Transmission == "Automatic") %>%
    mutate(Consumption = Fuel.Economy * 0.425) %>%
    group_by(Cylinders) %>%
    summarise(Avg.Consumption = mean(Consumption)) %>%
    as.data.frame()

#Export or the Load in ETL now
#save the results to a CSV file
write.csv(
          x = efficiency,
          file = "Fuel Efficiency.csv",
          row.names = FALSE)

#check the results for new variable efficiency
print(efficiency)

# Create a frequency table
table(cars$Transmission)

# Get the minimum value
min(cars$Fuel.Economy)

# Get the maximum value
max(cars$Fuel.Economy)

# Get the average value
mean(cars$Fuel.Economy)

# Get the median value
median(cars$Fuel.Economy)

# Get the quartiles
quantile(cars$Fuel.Economy)

# Get the standard deviation
sd(cars$Fuel.Economy)

# Get the total value
sum(cars$Fuel.Economy)

# Get the correlation coefficient
cor(
    x = cars$Cylinders,
    y = cars$Fuel.Economy)

# Summarize an entire table



# do soem data visualizaiton now

library(ggplot2)

# Create a frequency bar chart
ggplot(
    data = cars,
    aes(x = Transmission)) +
    geom_bar() +
    ggtitle("Count of Cars by Transmission Type") +
    xlab("Transmission Type") +
    ylab("Count of Cars")

# Create a histogram
ggplot(
    data = cars,
    aes(x = Fuel.Economy)) +
    geom_histogram(
        bins = 10) +
        ggtitle("Distribution of Fuel Economy") +
        xlab("Fuel Economy (mpg)") +
        ylab("Count of Cars")

# Create a density plot
ggplot(
    data = cars,
    aes(x = Fuel.Economy)) +
    geom_density() +
    ggtitle("Distribution of Fuel Economy") +
    xlab("Fuel Economy (mpg)") +
    ylab("Density")

# Create a scatterplot
ggplot(
    data = cars,
    aes(
        x = Cylinders,
        y = Fuel.Economy)) +
        geom_point() +
        ggtitle("Fuel Economy by Cylinders") +
        xlab("Number of Cylinders") +
        ylab("Fuel Economy (mpg)")