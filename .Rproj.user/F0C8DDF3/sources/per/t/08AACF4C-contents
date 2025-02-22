# Load required libraries
library(ggplot2)
library(readxl)
library(scales)  # For formatting numbers

# Read the Excel file
Suicide_data <- read_excel("Processed Data/Promise me do not suicide.xlsx")

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



