# Load required libraries
library(readr)
library(ggplot2)

# Read the data from CSV
data <- read_csv("Raw Data/covid19_sg.csv")

# Convert Date column to Date format
data$Date <- as.Date(data$Date)

# Line plot for daily confirmed cases
ggplot(data, aes(x = Date, y = `Daily Confirmed`)) +
  geom_line(color = "blue") +
  labs(title = "Trend of Daily Confirmed Cases",
       x = "Date",
       y = "Daily Confirmed Cases") +
  theme_minimal()

# Bar plot for daily deaths
ggplot(data, aes(x = Date, y = `Daily Deaths`)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Distribution of Daily Deaths",
       x = "Date",
       y = "Daily Deaths") +
  theme_minimal()
