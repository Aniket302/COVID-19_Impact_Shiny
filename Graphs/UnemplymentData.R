# Load required libraries
library(readxl)
library(ggplot2)
library(tidyr)

# Read the data from Excel file
data <- read_excel("Processed Data/unemployment2.xlsx")

# Melt the data for easier plotting
melted_data <- pivot_longer(data, cols = -`Data Series`, names_to = "Year", values_to = "Value")

# Filter the data to keep only age group data
melted_data <- melted_data[melted_data$`Data Series` %in% c("Age Group (Years):25 - 29",
                                                            "Age Group (Years):30 - 39",
                                                            "Age Group (Years):40 - 49",
                                                            "Age Group (Years):50 - 59",
                                                            "Age Group (Years):60 & Over",
                                                            "Age Group (Years):15 - 24"),]

# Convert 'Year' to numeric
melted_data$Year <- as.numeric(melted_data$Year)

# Line plot
line_plot <- ggplot(melted_data, aes(x = Year, y = Value, color = `Data Series`)) +
  geom_line() +
  labs(title = "Trend Over Years (Age Groups)",
       x = "Year",
       y = "Percentage Unemployed") +
  theme_minimal()

# Bar plot
bar_plot <- ggplot(melted_data, aes(x = Year, y = Value, fill = `Data Series`)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Comparison Over Years (Age Groups)",
       x = "Year",
       y = "Percentage Unemployed") +
  theme_minimal() +
  theme(legend.position = "top")

# Display the plots
print(line_plot)
print(bar_plot)
