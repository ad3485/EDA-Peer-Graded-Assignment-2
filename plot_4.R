coalSCC <- SCC[grep("[Cc][Oo][Aa][Ll]", SCC$EI.Sector), "SCC"]
coalNEI <- NEI %>% filter(SCC %in% coal_SCC)
csummary <- coalNEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

c_plot <- ggplot(csummary, aes(x=year, y=round(Emissions/1000,2), label=round(Emissions/1000,2), fill=year)) +
  g_bar(stat="identity") + y_lab(expression('PM'[2.5]*' Emissions in Kilotons')) + x_lab("Year") +
  g_label(aes(fill = year),colour = "white", fontface = "bold") +
  ggtitle("Coal Combustion Emissions between 1999-2008")
print(c_plot)