# Load the necessary libraries
library(shiny)
library(ggplot2)
library(readxl)
library(tidyr)
library(scales)  # For formatting numbers

# Read the Excel file
CPI_data <- read_excel("/Applications/SMU/Applied Stastical Analysis with R/Shiny/Data to be graph/CPI.xlsx")

# Convert "Time Period" to Date format if it's not already
CPI_data$`Time Period` <- as.Date(CPI_data$`Time Period`)

# Dynamically select columns
cols_to_pivot <- names(CPI_data)[!names(CPI_data) %in% c("Time Period")]

# Define UI
ui <- fluidPage(
  titlePanel("CPI Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("category", "Select a category:",
                  choices = cols_to_pivot)
    ),
    mainPanel(
      plotOutput("scatterplot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Determine the range of CPI values
  cpi_range <- range(CPI_data[, cols_to_pivot])
  
  output$scatterplot <- renderPlot({
    # Pivot data to long format
    CPI_long <- pivot_longer(CPI_data, 
                             cols = all_of(input$category), 
                             names_to = "Category", 
                             values_to = "CPI")
    
    # Create scatter plot
    ggplot(CPI_long, aes(x = `Time Period`, y = CPI)) + 
      geom_point(alpha = 0.6) +  
      theme_minimal() + 
      labs(title = paste("CPI Over Time for", input$category),
           x = "Time Period", 
           y = "CPI") +
      scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
      ylim(cpi_range) +  # Set y-axis limits
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
}

# Run the application
shinyApp(ui = ui, server = server)