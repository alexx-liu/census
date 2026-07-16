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
income_tx |>
  st_drop_geometry() |>
  ggplot(aes(x = estimate)) +
  geom_histogram(bins = 30, color = "white", fill = "steelblue") +
  scale_x_continuous(labels = scales::label_dollar()) +
  labs(
    title = "Texas Counties: Median Household Income (2020)",
    x = "County median household income",
    y = "Number of counties"
  )
#
#
#
#
