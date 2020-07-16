fips_lookup <- data.frame(fips = c("06037", "24510"), county = c("LA", "Baltimore"))

vehicles_SCC <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
vehicleEms <- NEI %>% filter(SCC %in% vehiclesSCC & fips %in% fips_lookup$fips) %>% group_by(fips, year) %>%
  summarize(Emissions = sum(Emissions))

vehicleEms <- merge(vehicleEms, fips_lookup)

bcv_plot <- ggplot(vehicleEms, aes(x = factor(year), y = round(Emissions/1000, 2), label=round(Emissions/1000,2), fill = year)) +
  g_bar(stat = "identity") + facet_grid(. ~ county) +
  y_lab(expression('PM'[2.5]*' Emissions (kt) ')) + x_lab("Year") +
  g_label(aes(fill = year),colour = "white", fontface = "bold") +
  ggtitle("Motor Vehicle Emissions, LA vs. Baltimore between 1999-2008")
print(bcvplot)