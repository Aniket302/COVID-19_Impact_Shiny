# Load the necessary libraries
library(ggplot2)
library(readxl)
library(tidyr)
library(dplyr)

# Read the Excel file
room_data <- read_excel("Processed Data/111-2.xlsx")

# Pivot data to long format for easier plotting with ggplot2
room_data_long <- pivot_longer(room_data, 
                               cols = -Year, # This selects all columns except 'Year' for pivoting
                               names_to = "Room_Type", 
                               values_to = "Price")

# Determine the min and max of Year and Price for setting plot limits
year_range <- range(room_data$Year, na.rm = TRUE)
price_range <- range(room_data_long$Price, na.rm = TRUE)

# Filter room_data_long dataframe to include only "Room_2" and "Room_3"
room_data_filtered <- room_data_long %>%
  filter(Room_Type %in% c("2 Room", "3 Room", "4 Room", "5 Room", "6 Room"))

# Create the plot
ggplot(room_data_filtered, aes(x = Year, y = Price, color = Room_Type)) + 
  geom_line() + # Use geom_line for a line chart
  theme_minimal() + 
  labs(title = "Room Prices Over Years",
       x = "Year", 
       y = "Price") +
  scale_x_continuous(limits = year_range, breaks = scales::pretty_breaks(n = 8)) + # Dynamically set x-axis limits
  scale_y_continuous(limits = price_range) + # Dynamically set y-axis limits
  scale_color_brewer(palette = "Set1")
