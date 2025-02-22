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

# Build the bar chart
bar_chart <- ggplot(Infection_data, aes(x = `Time Period`, y = `Cumulative Confirmed`, fill = `Phase`)) +
  geom_bar(stat = "identity") + 
  scale_y_continuous(breaks = breaks, labels = comma) +
  scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") +
  theme_minimal() +
  labs(x = "Time Period", y = "Cumulative Confirmed", title = "COVID-19 Cumulative Confirmed Cases Over Time") +
  scale_fill_manual(values = c("Circuit Breaker" = "red",
                               "Phase 1" = "darkblue",
                               "Phase 2" = "blue",
                               "Phase 2 (Heightened Alert)" = "skyblue",
                               "Phase 3" = "purple",
                               "Phase 3 (Heightened Alert)" = "violet",
                               "Preparatory Stage" = "orange",
                               "Stabilisation Phase" = "yellow",
                               "Transition Phase" = "lightyellow"))

# Display the bar chart
bar_chart
