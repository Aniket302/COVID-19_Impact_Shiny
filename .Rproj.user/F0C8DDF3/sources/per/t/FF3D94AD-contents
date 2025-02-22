# #Load all libraries to be used
library(shiny)
library(shinydashboard)
library(tidyverse)
library(readxl)
library(openxlsx)
library(leaflet)
library(leaflet.extras)
library(scales)
library(tmap)
library(sf)

# These libraries are already included with tidyverse
#library(readr)
#library(dplyr)
#library(tidyr)
#library(ggplot2)

# Shinydashboard 
ui <- dashboardPage(skin = 'green',
      
      # Define Header -----------------
      dashboardHeader(title = 'COVID Impact Analysis', titleWidth = 400),
      
      # Define sidebar --------------
      dashboardSidebar(
        sidebarMenu(menuItem('COVID Trends', tabName = 'Covid', icon = icon("heartbeat")),
                    menuItem('Health', tabName = 'Health', icon = icon("ambulance")),
                    menuItem('Economic Impact', tabName = 'Economic', icon = icon("dollar")),
                    menuItem('Rental Impact', tabName = 'Rental', icon = icon("home"))
        )
      ),
      
      # Define Body ------------------
      dashboardBody(
        tabItems(
          
          # Covid TAB --------
          tabItem(tabName = 'Covid',
                  fluidPage(
                    titlePanel("Observed period of lockdown : "),
                    tags$ul(
                      tags$li("Infection cases start ~ Apr 2020"),
                      tags$li("Infection cases tightly controlled ~ Apr 2020 to Sep 2021"),
                      tags$li("Scope of investigation - PRE Apr 2020 and POST Sep 2021"),
                      tags$li(tags$b("Question: What was the impact of ~ 1.5 years of lockdown on Healthcare, Economy, Education?"))
                    ),

                    fluidRow(
                      # Covid: Cumilative Confirmed Cases Over Time --------
                      column(6,
                        plotOutput('infection_cumulative', height = "250" )
                      ),
                      
                      # Covid: Distribution of Daily Deaths --------
                      column(6,
                             plotOutput('daily_deaths_dist', height = "250" )
                      )
                    ),
                    
                    fluidRow(
                      # Covid: Daily Infection --------
                      column(6,
                             plotOutput('daily_infection', height = "250" )
                      ),
                      
                      # Covid: Intensive Care (ICU) --------
                      column(6,
                             plotOutput('ICU', height = "250" )
                      )
                    )
                  )
          ),
          
          # Heath TAB -------
          tabItem(tabName = 'Health',
                  fluidPage(
                    titlePanel(tags$b("Descriptive Statistics | Health Impact Analysis")),
                    tabsetPanel(
                      
                      # Health: Hospitilisations Chart------------
                      tabPanel("Hospitilisations",
                               fluidRow(dateRangeInput("date_range_2", "Date Range",
                                                       start = "2020-01-23", end = "2022-01-08",
                                                       min = "2020-01-23", max = "2022-01-08",
                                                       format = "yyyy-mm-dd",
                                                       separator = " - "),
                                        plotOutput('Hospitilised', height = "400")
                               )
                      ),
                      
                      # Health: Divorce Rates ------------
                      tabPanel("Mental Health - Divorce",
                               fluidRow(
                                 plotOutput('Divorce', height = "450")
                               )
                      ),
                      
                      # Health: Suicide Rates ------------
                      tabPanel("Suicide Rate",
                               fluidRow(
                                 plotOutput('Suicide', height = "450")
                               )
                      )
                    )
                  )
          ),
          
          # Economic TAB -------
          tabItem(tabName = 'Economic',
                  fluidPage(
                    titlePanel(tags$b("Descriptive Statistics | Economy Impact Analysis")),
                    tabsetPanel(
                      
                      # Economic: CPI Analysis ------------
                      tabPanel('CPI Analysis',
                               fluidRow(
                                 box(
                                   selectInput(
                                      inputId='category',
                                      label = 'Filter By CPI Type', 
                                      choices=c(
                                        'All' = 'All',
                                        'Communication' = 'Communication',
                                        'Food Excl Food Serving Services' = 'Food Excl Food Serving Services',
                                        'Food Serving Services' = 'Food Serving Services',
                                        'Health Care' = 'Health Care',
                                        'Miscellaneous Goods & Services(Alcohol)' = 'Miscellaneous Goods & Services(Alcohol)',
                                        'Recreation & Culture' = 'Recreation & Culture',
                                        'Transport' = 'Transport'
                                        )
                                   )
                                 ),
                                 plotOutput('CPI', height = "450", width = "900")
                               )
                      ),
                      
                      # Economic: Unemployement Age Chart -------
                      tabPanel("Unemployment By Age",
                               fluidRow(
                                 box(
                                   selectInput(
                                     inputId='age',
                                     label = 'Age Group', 
                                     choices=c(
                                       'All' = 'All',
                                       '15-24 years' = 'Age Group (Years):15 - 24',
                                       '25-29 years' = 'Age Group (Years):25 - 29',
                                       '30-39 years' = 'Age Group (Years):30 - 39',
                                       '40-49 years' = 'Age Group (Years):40 - 49',
                                       '50-59 years' = 'Age Group (Years):50 - 59',
                                       '60 and above' = 'Age Group (Years):60 & Over'
                                     )
                                   )
                                 ),
                                   plotOutput('UnemployementAge', height = "450")
                               )
                      ),
                      
                      # Economic: Unemployment Qualification ------------
                      tabPanel("Unemployment By Qualification",
                               fluidRow(
                                 box(
                                   selectInput(
                                     inputId='qualification',
                                     label = 'Highest Qualification', 
                                     choices=c(
                                       'All' = 'All',
                                       'Below Secondary' = 'Below Secondary',
                                       'Secondary' = 'Secondary',
                                       'Post-Secondary (Non-Tertiary)' = 'Post-Secondary (Non-Tertiary)',
                                       'Degree' = 'Degree',
                                       'Diploma & Professional Qualification' = 'Diploma & Professional Qualification'
                                     )
                                   )
                                 ),
                                 plotOutput('UnemployementQualification', height = "400")
                               )
                      ),
                      
                      # Economic: Tourism - Airline Passenger counts ----------
                      tabPanel("Tourism (Airline Passenger Counts)",
                               fluidRow(dateRangeInput("date_range_1", "Date Range",
                                                       start = "2018-12-01", end = "2024-03-01",
                                                       min = "2018-12-01", max = "2024-03-01",
                                                       format = "yyyy-mm-dd",
                                                       separator = " - "),
                                    plotOutput('Airline', height = "400")
                                    )
                               )
                    )
                  )
          ),
          
          # Rental TAB -------
          tabItem(tabName = 'Rental',
                  fluidPage(
                    titlePanel(tags$b("Descriptive Statistics | Impact on Rent")),
                    tabsetPanel(
                      
                      # Rental: Rent Geoplot ----------
                      tabPanel("Rent Geoplot",
                               fluidRow(
                                 box(
                                   selectInput(
                                     inputId='filter_year',
                                     label = 'Yearly Rental Prices', 
                                     choices=c(
                                       'All' = 'All',
                                       '2021' = '2021',
                                       '2022' = '2022',
                                       '2023' = '2023'
                                     )
                                   )
                                 ),
                                 box(
                                   selectInput(
                                     inputId='filter_flat_type',
                                     label = 'Flat Type', 
                                     choices=c(
                                       'All' = 'All',
                                       '1-ROOM' = '1-ROOM',
                                       '2-ROOM' = '2-ROOM',
                                       '3-ROOM' = '3-ROOM',
                                       '4-ROOM' = '4-ROOM',
                                       '5-ROOM' = '5-ROOM',
                                       'EXECUTIVE' = 'EXECUTIVE'
                                     )
                                   )
                                 ),
                                 tmapOutput('Geoplot', height = 600)
                               )
                              ),
                      
                      # Rental: HDB Rental By Flat ----------
                      tabPanel("HDB Rental Prices",
                               box(
                                 selectInput(
                                   inputId='roomType',
                                   label = 'Room Type', 
                                   choices=c(
                                     'All' = 'All',
                                     '2 Room' = '2 Room',
                                     '3 Room' = '3 Room',
                                     '4 Room' = '4 Room',
                                     '5 Room' = '5 Room',
                                     '6 Room' = '6 Room'
                                   )
                                 )
                               ),
                               plotOutput('HDBRent', height = "400"))
                    )
                  )
          )
        )
      )
)


# Load Server and charts --------------
server <- function(input, output) {
  
  # Covid: Infection Chart ---------
  output$infection_cumulative <- renderPlot({
    
    # Read the Excel file
    Infection_data <- read_excel("Processed Data/covid_19_sg_cases_hospitalised.xlsx")
    
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
    
  })
  
  # Economic: CPI Chart -----------
  output$CPI <- renderPlot({
    
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
    if(input$category != 'All') {
      CPI_long <- CPI_long %>% filter(Category == input$category)
    }
      
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
    
  })
  
  # Covid: Distrubution of Daily Deaths ---------
  output$daily_deaths_dist <- renderPlot({
    
    # Read the data from CSV
    data <- read_csv("Processed Data/covid_19_sg_cases_hospitalised.csv")
    
    # Convert Date column to Date format
    data$Date <- as.Date(data$Date)
    
    # Line plot for daily confirmed cases
    ggplot(data, aes(x = Date, y = `Daily Confirmed`)) +
      geom_line(color = "blue") +
      labs(title = "Trend of Daily Confirmed Cases",
           x = "Date",
           y = "Daily Confirmed Cases") +
      theme_minimal()
    
    # Bar plot for daily deaths
    ggplot(data, aes(x = Date, y = `Daily Deaths`)) +
      geom_bar(stat = "identity", fill = "skyblue") +
      labs(title = "Distribution of Daily Deaths",
           x = "Date",
           y = "Daily Deaths") +
      theme_minimal()
  })
    
  # Covid: Daily Infection -------
  output$daily_infection <- renderPlot({
    
    # Read the Excel file
    Infection_data <- read_excel("Processed Data/covid_19_sg_cases_hospitalised.xlsx")
    
    # Ensure "Time Period" is recognized as date or time data
    Infection_data$`Time Period` <- as.Date(Infection_data$`Time Period`)
    
    # Determine the range of y-axis values
    y_min <- min(Infection_data$`Daily Confirmed`)
    y_max <- max(Infection_data$`Daily Confirmed`)
    
    # Calculate break points for 8 equally spaced parts
    breaks <- pretty(c(y_min, y_max), n = 8)
    
    # Build the bar chart
    bar_chart <- ggplot(Infection_data, aes(x = `Time Period`, y = `Daily Confirmed`)) +
      geom_bar(stat = "identity", color = "salmon", fill = "salmon") + # Using identity stat for direct values
      scale_y_continuous(breaks = breaks, labels = comma) +
      scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") +  # Adjust date format and breaks as needed
      theme_minimal() +
      labs(x = "Time Period", y = "Daily Confirmed", title = "Daily Infection")
    
    # Display the bar chart
    bar_chart
    
  })
  
  # Covid: ICU -----------
  output$ICU <- renderPlot({
    
    # Read the Excel file
    Intensive_data <- read_excel("Processed Data/covid_19_sg_cases_hospitalised.xlsx")
    
    Intensive_data$`Time Period` <- as.Date(Intensive_data$`Time Period`)
    
    # Determine the range of y-axis values
    y_min <- min(Intensive_data$`Intensive Care Unit (ICU)`)
    y_max <- max(Intensive_data$`Intensive Care Unit (ICU)`)
    
    # Calculate break points for 8 equally spaced parts
    breaks <- pretty(c(y_min, y_max), n = 8)
    
    # Build the bar chart
    bar_chart <- ggplot(Intensive_data, aes(x = `Time Period`, y = `Intensive Care Unit (ICU)`)) +
      geom_bar(stat = "identity", color = "darkblue", fill = "lightblue") + # Using identity stat for direct values
      scale_y_continuous(breaks = breaks, labels = comma) +
      scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "6 month") +  # Adjust date format and breaks as needed
      theme_minimal() +
      labs(x = "Time Period", y = "ICU Unit", title = "Intensive Care")
    
    # Display the bar chart
    bar_chart
    
  })
  
  # Health: Hospitilisations --------------
  output$Hospitilised <- renderPlot({
    
    # Read the Excel file
    Hospital_data <- read_excel("Processed Data/covid_19_sg_cases_hospitalised.xlsx")
    
    # Filter data based on selected date range
    filtered_data <- Hospital_data
    if (!is.null(input$date_range_2)) {
      start_date <- as.Date(input$date_range_2[1])
      end_date <- as.Date(input$date_range_2[2])
      filtered_data <- subset(filtered_data, `Time Period` >= start_date & `Time Period` <= end_date)
    }
    
    # Ensure "Time Period" is recognized as date or time data
    filtered_data$`Time Period` <- as.Date(filtered_data$`Time Period`)
    
    # Determine the range of y-axis values
    y_min <- min(filtered_data$`Still Hospitalised`)
    y_max <- max(filtered_data$`Still Hospitalised`)
    
    # Calculate break points for 8 equally spaced parts
    breaks <- pretty(c(y_min, y_max), n = 8)
    
    # Build the scatter plot
    scatter_plot <- ggplot(filtered_data, aes(x = `Time Period`, y = `Still Hospitalised`)) +
      geom_point(color = "royalblue") +
      scale_y_continuous(breaks = breaks, labels = comma) +
      scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "3 month") + # Adjust date format and breaks as needed
      labs(title = "No. of Hospitilisations")  # Add title
    
    # Display the scatter plot
    scatter_plot
    
  })
  
  # Health: Divorce Rates --------------
  output$Divorce <- renderPlot({
    
    # Read the Excel file
    file_path <- "Processed Data/Divorce_Rate.xlsx"
    data <- read.xlsx(file_path)
    
    # Rename the columns
    colnames(data) <- c("Age_Group", "2015",	"2016",	"2017",	"2018",	"2019",	"2020",	"2021",	"2022")
    
    # Reshape the data for plotting
    data_long <- reshape2::melt(data, id.vars = "Age_Group")
    
    # Plot using ggplot2
    ggplot(data_long, aes(x = variable, y = value, group = Age_Group, color = Age_Group)) +
      geom_line() +
      geom_point() +
      labs(title = "Divorce Rates Over Years",
           x = "Year",
           y = "No. of Divorce",
           color = "Age Group") +
      theme_minimal()
    
  })
  
  # Health: Suicide Rates --------------
  output$Suicide <- renderPlot({
    
    # Read the Excel file
    Suicide_data <- read_excel("Processed Data/Suicide_Rate.xlsx")
    
    # Determine the range of y-axis values
    y_min <- min(Suicide_data$Suicides)
    y_max <- max(Suicide_data$Suicides)
    
    # Calculate break points for 8 equally spaced parts
    breaks <- pretty(c(y_min, y_max), n = 8)
    
    # Build the line chart with delicate aesthetics
    line_chart <- ggplot(Suicide_data, aes(x = factor(`Time Period`), y = Suicides, group = 1)) +
      geom_line(color = "#6b5b95", size = 1, linetype = "dashed") +  # Adjust line color, thickness, and type
      geom_point(color = "#fe346e", size = 2, shape = 16) +  # Adjust point color, size, and shape
      theme_minimal() +  # Use minimal theme
      theme(axis.text.x = element_text(angle = 45, hjust = 1),  # Rotate x-axis labels
            axis.title = element_text(face = "italic", size = 12),  # Italicize axis titles
            plot.title = element_text(face = "bold", size = 16),  # Bold plot title
            panel.grid.major = element_blank(),  # Remove major gridlines
            panel.grid.minor = element_blank(),  # Remove minor gridlines
            panel.border = element_blank(),  # Remove panel border
            axis.line = element_line(color = "black")) +  # Set axis line color
      labs(title = "Suicides", x = "Year", y = "Number of Suicides")
    
    # Display the line chart
    print(line_chart)
    
  })
  
  # Economic: Unemployment Age -----------
  output$UnemployementAge <- renderPlot({
    
    # Read the data from Excel file
    data <- read_excel("Processed Data/Unemployment_Age_Qualification.xlsx")
    
    # Melt the data for easier plotting
    melted_data <- pivot_longer(data, cols = -`Group`, names_to = "Year", values_to = "Value")
    
    # Filter the data to keep only age group data
    melted_data <- melted_data[melted_data$`Group` %in% c("Age Group (Years):25 - 29",
                                                                "Age Group (Years):30 - 39",
                                                                "Age Group (Years):40 - 49",
                                                                "Age Group (Years):50 - 59",
                                                                "Age Group (Years):60 & Over",
                                                                "Age Group (Years):15 - 24"), ]
    
    # If Filter was used
    if(input$age != 'All') {
      melted_data <- melted_data %>% filter(`Group` == input$age)
    }
    
    # Convert 'Year' to numeric
    melted_data$Year <- as.numeric(melted_data$Year)
    
    # Bar plot
    bar_plot <- ggplot(melted_data, aes(x = Year, y = Value, fill = `Group`)) +
      geom_bar(stat = "identity", position = "dodge") +
      labs(title = "Comparison Over Years (Age Groups)",
           x = "Year",
           y = "Percentage Unemployed") +
      theme_minimal() +
      theme(legend.position = "top")
    
    # Display the bar plot
    print(bar_plot)
    
  })
  
  # Economic: Unemployment by Highest Qualification -----------
  output$UnemployementQualification <- renderPlot({
    
    # Read the data from Excel file
    data <- read_excel("Processed Data/Unemployment_Age_Qualification.xlsx")
    
    # Melt the data for easier plotting
    melted_data <- pivot_longer(data, cols = -`Group`, names_to = "Year", values_to = "Value")
    
    # Filter the data to keep only highest qualification data
    melted_data <- melted_data[melted_data$`Group` %in% c("Below Secondary", 
                                                                "Secondary",
                                                                "Post-Secondary (Non-Tertiary)",
                                                                "Diploma & Professional Qualification",
                                                                "Degree"), ]
    
    # If Filter was used
    if(input$qualification != 'All') {
      melted_data <- melted_data %>% filter(`Group` == input$qualification)
    }
    
    # Convert 'Year' to numeric
    melted_data$Year <- as.numeric(melted_data$Year)
    
    # Line plot
    line_plot <- ggplot(melted_data, aes(x = Year, y = Value, color = `Group`)) +
      geom_line() +
      labs(title = "Trend Over Years (Highest Qualification)",
           subtitle = "Unemployment",
           x = "Year",
           y = "Percentage Unemployed") +
      theme_minimal()
    
    print(line_plot)
    
  })
  
  # Economic: Tourism - Airline passenger graph ---------
  output$Airline <- renderPlot({
    
    # Read the Excel file
    Airline_data <- read_excel("Processed Data/SG_Airline_Passenger_Carriage.xlsx")
    
    # Filter data based on selected date range
    filtered_data <- Airline_data
    if (!is.null(input$date_range_1)) {
      start_date <- as.Date(input$date_range_1[1])
      end_date <- as.Date(input$date_range_1[2])
      filtered_data <- subset(filtered_data, `Time Period` >= start_date & `Time Period` <= end_date)
    }
    
    # Ensure "Time Period" is recognized as date or time data
    filtered_data$`Time Period` <- as.Date(filtered_data$`Time Period`)
    
    # Determine the range of y-axis values
    y_min <- min(filtered_data$`Passenger Carriage (000')`)
    y_max <- max(filtered_data$`Passenger Carriage (000')`)
    
    # Calculate break points for 8 equally spaced parts
    breaks <- pretty(c(y_min, y_max), n = 8)
    
    # Build the bar chart
    bar_chart <- ggplot(filtered_data, aes(x = `Time Period`, y = `Passenger Carriage (000')`)) +
      geom_bar(stat = "identity", color = "blue", fill = "lightblue") + # Using identity stat for direct values
      scale_y_continuous(breaks = breaks, labels = comma) +
      scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "3 month") +  # Adjust date format and breaks as needed
      theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
      labs(x = "Time Period", y = "Passenger Carriage (000')", title = "Airline Passenger")
    
    # Display the bar chart
    bar_chart
    
  })
  
  # Rental: HDB Rent by room -------
  output$HDBRent <- renderPlot({
    
    # Read the Excel file
    room_data <- read_excel("Processed Data/HDB_Rent_Prices.xlsx")
    
    # Pivot data to long format for easier plotting with ggplot2
    room_data_long <- pivot_longer(room_data, 
                                   cols = -Year, # This selects all columns except 'Year' for pivoting
                                   names_to = "Room_Type", 
                                   values_to = "Price")
    
    # Determine the min and max of Year and Price for setting plot limits
    year_range <- range(room_data$Year, na.rm = TRUE)
    price_range <- range(room_data_long$Price, na.rm = TRUE)
    
    # Filter room_data_long dataframe based on roomType input
    if (input$roomType != "All") 
    {
      room_data_filtered <- room_data_long %>%
        filter(Room_Type == input$roomType)
    } 
    else 
    {
      room_data_filtered <- room_data_long %>%
        filter(Room_Type %in% c("2 Room", "3 Room", "4 Room", "5 Room", "6 Room"))
    }
    
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
  })
  
  # Rental: Geoplot --------
  output$Geoplot <- renderTmap({
    
    # Load the shapefile
    singapore_map <- st_read("shapefile/MP14_SUBZONE_NO_SEA_PL.shp")
    
    # Assuming your data is in the following format
    rental_data <- read_xlsx("Processed Data/HDB_Rent_By_Region.xlsx")
    
    if(input$filter_year != "All") {
        rental_data <- rental_data %>% 
        filter(rent_approval_YEAR == input$filter_year)
    }
    
    if(input$filter_flat_type != "All") {
        rental_data <- rental_data %>%
        filter(flat_type == input$filter_flat_type)
    }
    
    rental_data <- rental_data %>%
      group_by(`town`) %>%
      summarise(monthly_rent=mean(`monthly_rent`))
    
    
    # # Merge the rental data with the shapefile
    data_map_area <- left_join(singapore_map, rental_data, by= c("PLN_AREA_N" = "town"))
    
    
    # color the polygon with data
    data_map_area <- st_make_valid(data_map_area)
    tmap_options(check.and.fix = TRUE)
    tmap_mode("view")
    qtm(data_map_area, fill="monthly_rent", fill.id = "PLN_AREA_N", title = "Transaction Price by Region")
    
  })
  
}

shinyApp(ui, server)
