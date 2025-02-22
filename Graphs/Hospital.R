# Load required libraries
library(ggplot2)
library(readxl)
library(scales)  # For formatting numbers

# Read the Excel file
Hospital_data <- read_excel("Processed Data/covid19_sg.xlsx")

# Ensure "Time Period" is recognized as date or time data
Hospital_data$`Time Period` <- as.Date(Hospital_data$`Time Period`)

# Determine the range of y-axis values
y_min <- min(Hospital_data$`Still Hospitalised`)
y_max <- max(Hospital_data$`Still Hospitalised`)

# Calculate break points for 8 equally spaced parts
breaks <- pretty(c(y_min, y_max), n = 8)

# Build the scatter plot
scatter_plot <- ggplot(Hospital_data, aes(x = `Time Period`, y = `Still Hospitalised`)) +
  geom_point() +
  scale_y_continuous(breaks = breaks, labels = comma) +
  scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "3 month") + # Adjust date format and breaks as needed
  labs(title = "Still Hospitalised")  # Add title

# # Build the bar chart
# bar_chart <- ggplot(Hospital_data, aes(x = `Time Period`, y = `Still Hospitalised`)) +
#   geom_bar(stat = "identity", color = "blue", fill = "lightblue") + # Using identity stat for direct values
#   scale_y_continuous(breaks = breaks, labels = comma) +
#   scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "3 month") +  # Adjust date format and breaks as needed
#   theme_minimal() +
#   labs(x = "Time Period", y = "Still Hospitalised", title = "Still Hospitalised")


# # Build the line chart
# line_chart <- ggplot(Hospital_data, aes(x = `Time Period`, y = `Still Hospitalised`)) +
#   geom_line() +  # Change to geom_line for line chart
#   scale_y_continuous(breaks = breaks, labels = comma) +
#   scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "1 month")  # Adjust date format and breaks as needed


# Display the scatter plot
scatter_plot

# # Display the bar chart
# bar_chart

# # Display the line chart
# line_chart