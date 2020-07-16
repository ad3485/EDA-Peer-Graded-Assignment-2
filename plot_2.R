baltimore_emissions <- NEI[NEI$fips=="24510",] %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

with(baltimore_emissions, barplot(height=Emissions/1000, names = year, col = colors, 
             x_lab = "Year", y_lab = expression('PM'[2.5]*' in Kilotons'), main = expression('Baltimore Emissions between 1999-2008')))