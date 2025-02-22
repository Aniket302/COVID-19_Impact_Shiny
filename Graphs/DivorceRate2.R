library(ggplot2)
library(openxlsx)

file_path <- "Processed Data/DivorceRate.xlsx"
# Read the Excel file
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

