# Load required libraries
library(readxl)
library(ggplot2)
library(tidyr)

# Read the data from Excel file
data <- read_excel("Processed Data/unemployment2.xlsx")

# Melt the data for easier plotting
melted_data <- pivot_longer(data, cols = -`Data Series`, names_to = "Year", values_to = "Value")

# Filter the data to keep only highest qualification data
melted_data <- melted_data[melted_data$`Data Series` %in% c("Below Secondary", 
                                                            "Secondary",
                                                            "Post-Secondary (Non-Tertiary)",
                                                            "Diploma & Professional Qualification",
                                                            "Degree"), ]

# Convert 'Year' to numeric
melted_data$Year <- as.numeric(melted_data$Year)

# Line plot
line_plot <- ggplot(melted_data, aes(x = Year, y = Value, color = `Data Series`)) +
  geom_line() +
  labs(title = "Trend Over Years (Highest Qualification)",
       subtitle = "Unemployment",
       x = "Year",
       y = "Value") +
  theme_minimal()

# Bar plot
bar_plot <- ggplot(melted_data, aes(x = Year, y = Value, fill = `Data Series`)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Comparison Over Years (Highest Qualification)",
       subtitle = "Unemployment",
       x = "Year",
       y = "Value") +
  theme_minimal() +
  theme(legend.position = "top")

# Display the plots
print(line_plot)
print(bar_plot)

