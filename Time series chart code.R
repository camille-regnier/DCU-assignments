# Install R packages if not installed -------------------------------------
if (!require("ggplot2")) install.packages("ggplot2", dependencies = TRUE) 
if (!require("tidyverse")) install.packages("tidyverse", dependencies = TRUE)

# Load R packages ---------------------------------------------------------
library(tidyr)
library(ggplot2)         

# Load the data -----------------------------------------------------------
unicef_indicator <- read.csv("/cloud/project/unicef_indicator_2.csv")
unicef_metadata <- read.csv("/cloud/project/unicef_metadata (1).csv")

# Convert the data to a time series object
unicef_ts <- ts(unicef_indicator$obs_value, start = c(2005), end = c(2021), frequency = 1)

# Create the time series chart
plot(unicef_ts, type = "l", xlab = "Years", ylab = "% of children treated (< age 5)", 
     main = "Diarrhoea Treatment over Time")
