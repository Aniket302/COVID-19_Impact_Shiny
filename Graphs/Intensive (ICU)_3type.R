# Load required libraries
library(ggplot2)
library(readxl)
library(scales)  # For formatting numbers

# Read the Excel file
Intensive_data <- read_excel("Processed Data/covid19_sg.xlsx")

Intensive_data$`Time Period` <- as.Date(Intensive_data$`Time Period`)

# Determine the range of y-axis values
y_min <- min(Intensive_data$`Intensive Care Unit (ICU)`)
y_max <- max(Intensive_data$`Intensive Care Unit (ICU)`)

# Calculate break points for 8 equally spaced parts
breaks <- pretty(c(y_min, y_max), n = 8)

# # Build the scatter plot
# scatter_plot <- ggplot(Intensive_data, aes(x = `Time Period`, y = `Intensive Care Unit (ICU)`)) +
#   geom_point(width = 0.7) +
#   scale_y_continuous(breaks = breaks, labels = comma) +
#   scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") + # Adjust date format and breaks as needed
#   labs(title = "Intensive Care")  # Add title

# # Build the line chart
# line_chart <- ggplot(Intensive_data, aes(x = `Time Period`, y = `Intensive Care Unit (ICU)`)) +
#   geom_line() +  # Change to geom_line for line chart
#   scale_y_continuous(breaks = breaks, labels = comma) +
#   scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") + # Adjust date format and breaks as needed
#   labs(title = "Intensive Care")

# Build the bar chart
bar_chart <- ggplot(Intensive_data, aes(x = `Time Period`, y = `Intensive Care Unit (ICU)`)) +
  geom_bar(stat = "identity", color = "darkblue", fill = "lightblue") + # Using identity stat for direct values
  scale_y_continuous(breaks = breaks, labels = comma) +
  scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") +  # Adjust date format and breaks as needed
  theme_minimal() +
  labs(x = "Time Period", y = "ICU Unit", title = "Intensive Care")

# # Display the scatter plot
# scatter_plot

# # Display the line chart
# line_chart

# Display the bar chart
bar_chart
