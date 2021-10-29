
##allocate line name to station
PHL_stops <- st_drop_geometry(septaStops) %>%
  select(-Line)

Line_A <- c("69th Street Transportation Center","Millbourne","63rd","60th","56th")
Line_B <- c("52nd","46th","40th","34th","30th")

PHL_line <- PHL_stops %>%
  mutate(Line = case_when(
    Station %in% Line_A ~ "Line A",
    Station %in% Line_B ~ "Line B"
  ))