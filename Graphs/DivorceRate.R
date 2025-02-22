# Install and load necessary packages
install.packages("ggplot2")
library(ggplot2)

# Create a data frame with the provided data
data <- data.frame(
  Age_Group = c("Under 25", "25-29", "30-34", "35-39", "40-44", "45-49", "50-54", "55-59", "60 & Over"),
  `2022` = c(30, 328, 915, 1155, 1163, 1023, 833, 623, 841),
  `2021` = c(43, 353, 1042, 1392, 1275, 1135, 854, 676, 892),
  `2020` = c(40, 352, 968, 1271, 1107, 1001, 702, 582, 669),
  `2019` = c(60, 407, 996, 1326, 1234, 1104, 852, 622, 712),
  `2018` = c(58, 398, 926, 1346, 1176, 1083, 813, 576, 601),
  `2017` = c(55, 440, 982, 1295, 1300, 1002, 863, 624, 635),
  `2016` = c(64, 438, 997, 1397, 1256, 1054, 855, 566, 565),
  `2015` = c(81, 396, 1013, 1299, 1288, 1057, 886, 540, 537)
)

# Convert the data to long format
library(reshape2)
data_long <- melt(data, id.vars = "Age_Group", variable.name = "Year", value.name = "Number")

# Plot the data
ggplot(data_long, aes(x = as.numeric(Year), y = Number, color = Age_Group, group = Age_Group)) +
  geom_line() +
  labs(title = "Divorce Rate by Age Group Over the Years",
       x = "Year",
       y = "Number of Divorces",
       color = "Age Group") +
  theme_minimal() +
  theme(legend.position = "top")

