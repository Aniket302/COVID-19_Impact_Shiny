# Load required libraries
library(ggplot2)
library(readxl)
library(scales)  # For formatting numbers

# Read the Excel file
Infection_data <- read_excel("Processed Data/covid19_sg.xlsx")

# Ensure "Time Period" is recognized as date or time data
Infection_data$`Time Period` <- as.Date(Infection_data$`Time Period`)

# Determine the range of y-axis values
y_min <- min(Infection_data$`Cumulative Confirmed`)
y_max <- max(Infection_data$`Cumulative Confirmed`)

# Calculate break points for 8 equally spaced parts
breaks <- pretty(c(y_min, y_max), n = 8)

# Build the scatter plot
scatter_plot <- ggplot(Infection_data, aes(x = `Time Period`, y = `Cumulative Confirmed`)) +
  geom_point() +
  scale_y_continuous(breaks = breaks, labels = comma) +
  scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "3 month") + # Adjust date format and breaks as needed
  labs(title = "Infection 2020-2022")  # Add title

# # Build the bar chart
# bar_chart <- ggplot(Infection_data, aes(x = `Time Period`, y = `Cumulative Confirmed`)) +
#   geom_bar(stat = "identity", color = "blue", fill = "lightblue") + # Using identity stat for direct values
#   scale_y_continuous(breaks = breaks, labels = comma) +
#   scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "3 month") +  # Adjust date format and breaks as needed
#   theme_minimal() +
#   labs(x = "Time Period", y = "Cumulative Confirmed", title = "COVID-19 Cumulative Confirmed Cases Over Time")


# # Build the line chart
# line_chart <- ggplot(Infection_data, aes(x = `Time Period`, y = `Cumulative Confirmed`)) +
#   geom_line() +  # Change to geom_line for line chart
#   scale_y_continuous(breaks = breaks, labels = comma) +
#   scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "1 month")  # Adjust date format and breaks as needed


# Display the scatter plot
scatter_plot

# # Display the bar chart
# bar_chart

# # Display the line chart
# line_chart
