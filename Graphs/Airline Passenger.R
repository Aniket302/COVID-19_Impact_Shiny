# Load required libraries
library(ggplot2)
library(readxl)
library(scales)  # For formatting numbers

# Read the Excel file
Airline_data <- read_excel("Raw Data/Dataset_Airline_SG Airline_Passange carriage.xlsx")

# Ensure "Time Period" is recognized as date or time data
Airline_data$`Time Period` <- as.Date(Airline_data$`Time Period`)

# Determine the range of y-axis values
y_min <- min(Airline_data$`Passenger Carriage (000')`)
y_max <- max(Airline_data$`Passenger Carriage (000')`)

# Calculate break points for 8 equally spaced parts
breaks <- pretty(c(y_min, y_max), n = 8)

# # Build the scatter plot
# scatter_plot <- ggplot(Airline_data, aes(x = `Time Period`, y = `Passenger Carriage (000')`)) +
#   geom_point(width = 0.7) +
#   scale_y_continuous(breaks = breaks, labels = comma) +
#   scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") + # Adjust date format and breaks as needed
#   labs(title = "Airline Passenger")  # Add title

# # Build the line chart
# line_chart <- ggplot(Airline_data, aes(x = `Time Period`, y = `Passenger Carriage (000')`)) +
#   geom_line() +  # Change to geom_line for line chart
#   scale_y_continuous(breaks = breaks, labels = comma) +
#   scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") + # Adjust date format and breaks as needed
#   labs(title = "Airline Passenger")

# Build the bar chart
bar_chart <- ggplot(Airline_data, aes(x = `Time Period`, y = `Passenger Carriage (000')`)) +
  geom_bar(stat = "identity", color = "blue", fill = "lightblue") + # Using identity stat for direct values
  scale_y_continuous(breaks = breaks, labels = comma) +
  scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "3 month") +  # Adjust date format and breaks as needed
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(x = "Time Period", y = "Passenger Carriage (000')", title = "Airline Passenger")

# # Display the scatter plot
# scatter_plot

# # Display the line chart
# line_chart

# Display the bar chart
bar_chart
