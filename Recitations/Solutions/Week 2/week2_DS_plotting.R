##################################################################
# June 8, 2023
# Ryan Wei
#
# SIBDS practice with basic plots in R
##################################################################

# codes for plotting
data("penguins", package = "palmerpenguins")

library(tidyverse)
ggplot(penguins, aes(x = bill_length_mm, y = flipper_length_mm, color = species)) +
  geom_point()
ggsave("penguins_scatterplots.jpg")
