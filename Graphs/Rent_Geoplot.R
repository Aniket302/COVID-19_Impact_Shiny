# Load necessary libraries
library(dplyr)
library(tidyverse)
library(tmap)
library(ggplot2)
library(sf)
library(readxl)

# Load the shapefile
singapore_map <- st_read("shapefile/MP14_SUBZONE_NO_SEA_PL.shp")
# head(singapore_map)

# Assuming your data is in the following format
rental_data <- read_xlsx("Processed Data/RentingOutofFlats.xlsx")
head(rental_data)

filter_year <- "All"
filter_flat_type <- "5-ROOM"

if(filter_year != "All" | filter_flat_type != "All") {
  rental_data <- rental_data %>% 
    filter(rent_approval_YEAR == filter_year) %>% 
    filter(flat_type == filter_flat_type)
}

rental_data <- rental_data %>%
  group_by(`town`) %>%
  summarise(monthly_rent=mean(`monthly_rent`))

head(rental_data)

# # Merge the rental data with the shapefile
data_map_area <- inner_join(singapore_map, rental_data, by= c("PLN_AREA_N" = "town"))


# color the polygon with data
tmap_options(check.and.fix = TRUE)
tmap_mode("view")
qtm(data_map_area, fill="monthly_rent", fill.id = "PLN_AREA_N", title = "Transaction Price by Region")

