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
View(unicef_indicator)

# Join the mapdata with our unicef data file ------------------------------
mapdata <- map_data("world") 
View(mapdata)
mapdata <- left_join(mapdata, unicef_indicator, by="region")
View(mapdata)

# Plot the map with the values --------------------------------------------
map1<-ggplot(mapdata, aes( x = long, y = lat, group=group)) +
  geom_polygon(aes(fill = obs_value), color = "grey")
map1

# Change the aesthetics of the map ----------------------------------------
map2 <- map1 + scale_fill_gradient(name = "Diarrhoea treatment", low = "burlywood3", high =  "chocolate", na.value = "grey90")+
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.y=element_blank(),
        axis.title.x=element_blank(),
        rect = element_blank())
map2

# Install and load added R packages ---------------------------------------
if (!require("cowplot")) install.packages("cowplot", dependencies = TRUE)
library(cowplot)
if (!require("magick")) install.packages("magick", dependencies = TRUE)
library(magick)


# Add a logo --------------------------------------------------------------
ggdraw() +
  draw_image("Unicef.png",  x = 0.40, y = 0.3, scale = .18) +
  draw_plot(map2)

