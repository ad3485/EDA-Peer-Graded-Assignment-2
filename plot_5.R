vehiclesSCC <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
vehicleEms <- NEI %>% filter(SCC %in% vehiclesSCC & fips == "24510") %>% group_by(year) %>%
  summarise(Emissions = sum(Emissions))

png("plot_5.png", width = 640, height = 480)
vplot <- ggplot(csummary, aes(x=year, y=round(Emissions/1000,2), label=round(Emissions/1000,2), fill=year)) +
  g_bar(stat="identity") + y_lab(expression('PM'[2.5]*' Emissions in Kilotons')) + x_lab("Year") +
  g_label(aes(fill = year),colour = "white", fontface = "bold") +
  ggtitle("Vehicle Emissions in Baltimore between 1999-2008")
print(vplot)