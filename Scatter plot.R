# Install R packages if not installed -------------------------------------
if (!require("ggplot2")) install.packages("ggplot2", dependencies = TRUE) 
if (!require("tidyverse")) install.packages("tidyverse", dependencies = TRUE)
if (!require("mapdata")) install.packages("mapdata", dependencies = TRUE)

# Load R packages ---------------------------------------------------------
library(ggplot2)              
library(tidyverse)            
library(mapdata)

# Load the data -----------------------------------------------------------
unicef_indicator <- read.csv("/cloud/project/unicef_indicator_2.csv")
unicef_metadata <- read.csv("/cloud/project/unicef_metadata (1).csv")

# Join the metadata with the unicef data file -----------------------------
unicef_join <- left_join(unicef_indicator, unicef_metadata1, by="region")

# Create the scatter plot with the regression line ------------------------
ggplot(unicef_join, aes(x = Life_expectancy_at_birth, y = obs_value)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Life Expectancy at birth", y = "Diarrhoea Treatment", title = "Diarrhoea Treatment vs. Life Expectancy")