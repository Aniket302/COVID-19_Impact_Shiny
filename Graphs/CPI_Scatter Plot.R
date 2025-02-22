# Load the necessary libraries
library(ggplot2)
library(readxl)
library(tidyr)

# ANIKET REF: 
# STEP 1: Build filter Box
# box(
#   selectInput(
#     inputId='category',
#     label = 'Filter By CPI Type', 
#     choices=c(
#       'Health Care' = 'Health Care',
#       'Transport' = 'Transport',
#       'All' = 'All'
#     )
#   )
# )

# STEP 2: Add the Filter logic into chart generation using "input$<varname>" example below: 
# IF Filter was used: 
# if(input$category != 'All') {
#   CPI_long <- CPI_long %>% filter(Category == input$category)
# }


# Read the Excel file
CPI_data <- read_excel("Processed Data/CPI.xlsx")



# Convert "Time Period" to Date format if it's not already
CPI_data$`Time Period` <- as.Date(CPI_data$`Time Period`)

# Dynamically select columns if needed. Assuming all except 'Time Period' are to be used:
cols_to_pivot <- names(CPI_data)[!names(CPI_data) %in% c("Time Period")]



# Pivot data to long format
CPI_long <- pivot_longer(CPI_data, 
                         cols = all_of(cols_to_pivot), 
                         names_to = "Category", 
                         values_to = "Value")

# IF Filter was used: 
# if(input$category != 'All') {
#   CPI_long <- CPI_long %>% filter(Category == input$category)
# }


# Creating a scatter plot
ggplot(CPI_long, aes(x = `Time Period`, y = Value, color = Category)) + 
  geom_point(alpha = 0.6) +  # Adjust alpha for point transparency if desired
  theme_minimal() + 
  labs(title = "CPI Over Time by Category",
       x = "Time Period", 
       y = "CPI") +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  scale_color_brewer(palette = "Set3") +  # Use color for different categories
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


