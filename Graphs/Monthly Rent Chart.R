# Load required libraries
library(readxl)
library(ggplot2)
library(dplyr)

# Read the data from Excel
rent_data <- read_excel("Raw Data/RentingOutofFlats.xlsx")

# Convert rent_approval_date to factor for correct ordering
rent_data$rent_approval_date <- as.factor(rent_data$rent_approval_date)

# Create the scatter plot
ggplot(rent_data, aes(x = rent_approval_date, y = monthly_rent)) +
  geom_point(color = "blue") +
  labs(title = "Monthly Rent Distribution Over Time",
       x = "Rent Approval Date",
       y = "Monthly Rent (SGD)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

  