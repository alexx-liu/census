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
#| message: false
edu_state <- get_acs(
  geography = "state",
  variables = c("B15003_001", "B15003_022", "B15003_023", "B15003_024", "B15003_025"),
  summary_var = "B15003_001",
  year = 2020
)
#
#
#
edu_state |>
  group_by(variable) |>
  summarize(
    rows = n(),
    min_estimate = min(estimate, na.rm = TRUE),
    max_estimate = max(estimate, na.rm = TRUE)
  )
#
#
#
ggplot(income_tx) +
  geom_sf(aes(fill = estimate), color = "white", size = 0.1) +
  scale_fill_viridis_c(option = "plasma", name = "Median income") +
  labs(
    title = "Median household income by county, Texas (2020)",
    caption = "Source: ACS 5-year estimates via tidycensus"
  ) +
  theme_void()
#
#
#
#
