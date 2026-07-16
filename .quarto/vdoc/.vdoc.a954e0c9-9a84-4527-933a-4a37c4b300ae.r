#
#
#
#
#
#
#
#
#
#
#| message: false
library(tidyverse)
library(tidycensus)
library(sf)
#
#
#
#| message: false
#| include: false
income_tx <- get_acs(
  geography = "county",
  variables = "B19013_001",
  state = "TX",
  year = 2020,
  geometry = TRUE
)
#
#
#
ggplot(income_tx) +
  geom_sf(aes(fill = estimate), color = NA) +
  scale_fill_viridis_c(
    option = "cividis",
    direction = -1,
    labels = scales::label_dollar(),
    name = "Median household income (USD)"
  ) +
  labs(
    title = "Texas Counties: Median Household Income (2020)",
    caption = "Source: U.S. Census Bureau, ACS 2020 5-year estimates (B19013_001), via tidycensus"
  ) +
  coord_sf(datum = NA) +
  theme_minimal() +
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    legend.position = "right"
  )
#
#
#
#
