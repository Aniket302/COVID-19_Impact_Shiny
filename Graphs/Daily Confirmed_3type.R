# Load required libraries
library(ggplot2)
library(readxl)
library(scales)  # For formatting numbers

# Read the Excel file
Infection_data <- read_excel("Processed Data/covid19_sg.xlsx")

# Ensure "Time Period" is recognized as date or time data
Infection_data$`Time Period` <- as.Date(Infection_data$`Time Period`)

# Determine the range of y-axis values
y_min <- min(Infection_data$`Daily Confirmed`)
y_max <- max(Infection_data$`Daily Confirmed`)

# Calculate break points for 8 equally spaced parts
breaks <- pretty(c(y_min, y_max), n = 8)

# # Build the scatter plot
# scatter_plot <- ggplot(Infection_data, aes(x = `Time Period`, y = `Daily Confirmed`)) +
#   geom_point(width = 0.7) +
#   scale_y_continuous(breaks = breaks, labels = comma) +
#   scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") + # Adjust date format and breaks as needed
#   labs(title = "Daily Infection")  # Add title

# # Build the line chart
# line_chart <- ggplot(Infection_data, aes(x = `Time Period`, y = `Daily Confirmed`)) +
#   geom_line() +  # Change to geom_line for line chart
#   scale_y_continuous(breaks = breaks, labels = comma) +
#   scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") + # Adjust date format and breaks as needed
#   labs(title = "Daily Infection")

# Build the bar chart
bar_chart <- ggplot(Infection_data, aes(x = `Time Period`, y = `Daily Confirmed`)) +
  geom_bar(stat = "identity", color = "salmon", fill = "salmon") + # Using identity stat for direct values
  scale_y_continuous(breaks = breaks, labels = comma) +
  scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") +  # Adjust date format and breaks as needed
  theme_minimal() +
  labs(x = "Time Period", y = "Daily Confirmed", title = "Daily Infection")

# # Display the scatter plot
# scatter_plot

# # Display the line chart
# line_chart

# Display the bar chart
bar_chart
