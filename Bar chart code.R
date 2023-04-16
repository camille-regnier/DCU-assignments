# Install R packages if not installed -------------------------------------
if (!require("tidyverse")) install.packages("tidyverse", dependencies = TRUE)
if (!require("ggplot2")) install.packages("ggplot2", dependencies = TRUE)
if (!require("plotly")) install.packages("plotly", dependencies = TRUE)

# Load R packages ---------------------------------------------------------
library(tidyverse)
library(ggplot2)              
library(plotly)

# Load the data -----------------------------------------------------------
unicef_indicator <- read.csv("/cloud/project/unicef_indicator_2.csv")

# Create the plot using ggplot2
plot <- ggplot(unicef_indicator, aes(x = time_period, y = obs_value, fill = region)) +
  geom_bar(stat = "identity") +
  labs(x = NULL, y = "% of children treated (< age 5)", title = "Treatment of Diarrhoea") +
  guides(fill = FALSE)

# Convert the plot to a plotly object
plotly_plot <- ggplotly(plot)

# Display the plotly object
plotly_plot