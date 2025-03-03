library(readxl)
library(sf)
library(dplyr)
library(lubridate)
library(BSDA)

tourism_data<-read_xlsx("Raw Data/Dataset_Tourism.xlsx")
singapore_map <- st_read("shapefile/MP14_SUBZONE_NO_SEA_PL.shp")
rental_data <- read_xlsx("Processed Data/HDB_Rent_By_Region.xlsx")

data_map_area <- left_join(rental_data,singapore_map, by= c( "town" = "PLN_AREA_N"))
# View(data_map_area)

#Hypothesis Testing, rental prices   and post lockdown per number of bedrooms
#
#1 Room
#H0: rent of 1 room houses lockdown >= post lockdown
#H1: rent of 1 room  houses lockdown < post lockdown
one_room <- data_map_area[data_map_area$flat_type == "1-ROOM",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
one_room$rent_approval_date <- as.Date(paste0(one_room$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(one_room, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(one_room, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)

#2 Room
#H0: rent of 2 room houses   lockdown >= post lockdown
#H1: rent of 2 room  houses   lockdown < post lockdown
two_room <- data_map_area[data_map_area$flat_type == "2-ROOM",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
two_room$rent_approval_date <- as.Date(paste0(two_room$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(two_room, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(two_room, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)

#3 Room
#H0: rent of 3 room houses   lockdown >= post lockdown
#H1: rent of 3 room  houses   lockdown < post lockdown
three_room <- data_map_area[data_map_area$flat_type == "3-ROOM",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
three_room$rent_approval_date <- as.Date(paste0(three_room$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(three_room, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(three_room, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)

#4 Room
#H0: rent of 4 room houses   lockdown >= post lockdown
#H1: rent of 4 room  houses   lockdown < post lockdown
four_room <- data_map_area[data_map_area$flat_type == "4-ROOM",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
four_room$rent_approval_date <- as.Date(paste0(four_room$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(four_room, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(four_room, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)

#5 Room
#H0: rent of 5 room houses   lockdown >= post lockdown
#H1: rent of 5 room  houses   lockdown < post lockdown
five_room <- data_map_area[data_map_area$flat_type == "5-ROOM",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
five_room$rent_approval_date <- as.Date(paste0(five_room$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(five_room, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(five_room, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)

#Executive
#H0: rent of executive houses   lockdown >= post lockdown
#H1: rent of executive  houses   lockdown < post lockdown
executive <- data_map_area[data_map_area$flat_type == "EXECUTIVE",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
executive$rent_approval_date <- as.Date(paste0(executive$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(executive, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(executive, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)

#Hypothesis Testing for the rents during and post lockdown
#North
#H0: rent of houses in the north region   lockdown >= post lockdown
#H1: rent of houses in the north region   lockdown < post lockdown
north <- data_map_area[data_map_area$region == "North",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
north$rent_approval_date <- as.Date(paste0(north$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(north, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(north, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)


#North-East
#H0: rent of houses in the north-east region   lockdown >= post lockdown
#H1: rent of houses in the north-east region   lockdown < post lockdown
north_east <- data_map_area[data_map_area$region == "North-East",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
north_east$rent_approval_date <- as.Date(paste0(north_east$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(north_east, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(north_east, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)

#Central
#H0: rent of houses in the central region   lockdown >= post lockdown
#H1: rent of houses in the central region   lockdown < post lockdown
central <- data_map_area[data_map_area$region == "Central",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
central$rent_approval_date <- as.Date(paste0(central$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(central, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(central, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)

#West
#H0: rent of houses in the west region   lockdown >= post lockdown
#H1: rent of houses in the west region   lockdown < post lockdown
west <- data_map_area[data_map_area$region == "West",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
west$rent_approval_date <- as.Date(paste0(west$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(west, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(west, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)

#East
#H0: rent of houses in the east region   lockdown >= post lockdown
#H1: rent of houses in the east region   lockdown < post lockdown
east <- data_map_area[data_map_area$region == "East",c("rent_approval_date","monthly_rent")]
#assuming all are on the first day of approved month
east$rent_approval_date <- as.Date(paste0(east$rent_approval_date, "-01"), format = "%Y-%m-%d")
before_sep_2021 <- subset(east, rent_approval_date < as.Date("2021-09-01"))
str(before_sep_2021)
from_sep_2021 <- subset(east, rent_approval_date >= as.Date("2021-09-01"))
print(from_sep_2021)
str(from_sep_2021)
mean(before_sep_2021$monthly_rent)
mean(from_sep_2021$monthly_rent)
sigma_before <- sd(before_sep_2021$monthly_rent)
sigma_after <- sd(from_sep_2021$monthly_rent)
z.test(before_sep_2021$monthly_rent,from_sep_2021$monthly_rent,alternative = "less",mu=0,sigma.x=sigma_before,sigma.y=sigma_after,conf.level = 0.95)

