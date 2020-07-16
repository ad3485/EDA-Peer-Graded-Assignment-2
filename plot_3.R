baltimoreemissions2 <- NEI[NEI$fips=="24510",] %>%group_by(year, type) %>%
  summarise(Emissions=sum(Emissions))

baltimore_plot <- ggplot(data = baltimoreemissions2, aes(x = factor(year), y = Emissions, fill = type, colore = "black")) +
  g_bar(stat = "identity") + facet_grid(. ~ type) + x_lab("Year") + y_lab(expression('PM'[2.5]*' Emission')) + ggtitle("Baltimore Emissions by Source Type") 
print(baltimore_plot)