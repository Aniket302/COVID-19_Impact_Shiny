# Load required libraries
library(ggplot2)

# Load the CSV file
data <- read.csv("Raw Data/NumberofOverallUnemployedQuarterly.csv")

# Convert the 'period' column to Date type
data$period <- as.Date(paste(data$period, "01", sep="-"), format="%Y-%m-%d")

# Line Plot
line_plot <- ggplot(data, aes(x = period, y = seasonally_adj_unemp, color = residential_status)) +
  geom_line() +
  labs(title = "Seasonally Adjusted Unemployment Rate Over Time",
       x = "Period",
       y = "Seasonally Adjusted Unemployment Rate") +
  theme_minimal()

# Print the line plot
print(line_plot)

# Stacked Area Chart
stacked_area_chart <- ggplot(data, aes(x = period, y = seasonally_adj_unemp, fill = residential_status)) +
  geom_area() +
  labs(title = "Distribution of Seasonally Adjusted Unemployment Rate Over Time",
       x = "Period",
       y = "Seasonally Adjusted Unemployment Rate") +
  theme_minimal()

# Print the stacked area chart
print(stacked_area_chart)

# Box Plot
box_plot <- ggplot(data, aes(x = factor(substr(period, 1, 4)), y = seasonally_adj_unemp, fill = residential_status)) +
  geom_boxplot() +
  labs(title = "Distribution of Seasonally Adjusted Unemployment Rate Across Seasons",
       x = "Year",
       y = "Seasonally Adjusted Unemployment Rate") +
  theme_minimal()

# Print the box plot
print(box_plot)

# Bar Plot
bar_plot <- ggplot(data, aes(x = factor(substr(period, 1, 4)), y = seasonally_adj_unemp, fill = residential_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(title = "Average Seasonally Adjusted Unemployment Rate Across Seasons",
       x = "Year",
       y = "Average Seasonally Adjusted Unemployment Rate") +
  theme_minimal()

# Print the bar plot
print(bar_plot)


# Scatter Plot
scatter_plot <- ggplot(data, aes(x = seasonally_adj_unemp, y = non_seasonally_adj_unemp)) +
  geom_point() +
  labs(title = "Comparison of Seasonally Adjusted vs Non-Seasonally Adjusted Unemployment Rate",
       x = "Seasonally Adjusted Unemployment Rate",
       y = "Non-Seasonally Adjusted Unemployment Rate") +
  theme_minimal()

# Print the scatter plot
print(scatter_plot)