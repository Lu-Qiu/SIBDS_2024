##################################################################
# June 7, 2024
# Lu Qiu
#
# SIBDS practice Week 2 Problem 4
##################################################################

# codes for plotting
data("penguins", package = "palmerpenguins")

library(tidyverse)
ggplot(penguins, 
       aes(x = bill_length_mm, 
           y = flipper_length_mm, 
           color = species)) +
  geom_point() +
  theme_bw()

ggsave("penguins_scatterplots.jpg")
