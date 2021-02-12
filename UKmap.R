#rm(list = ls())
library(leaflet)
library(dplyr)

# Get UK polygon data
UK <- getData("GADM", country =  "GB", level = 2)

library(raster)
misc = list()
misc$countries = c("ZAF", "LSO", "SWZ", "ZWE", "MOZ", "NAM", "BWA")
UK = do.call("bind", lapply(misc$countries, 
                                   function(x) getData('GADM', country=x, level=0)))


### Create dummy data
set.seed(111)
mydf <- data.frame(place = unique(UK$NAME_0),
                   value = sample.int(n = 1000000, size = n_distinct(UK$NAME_0), replace = TRUE))

### Create five colors for fill
mypal <- colorQuantile(palette = "RdYlBu", domain = mydf$value, n = 5, reverse = TRUE)

leaflet() %>% 
  addProviderTiles("OpenStreetMap.Mapnik") %>%
 # setView(lat = 55, lng = -3, zoom = 6) %>%
  addPolygons(data = UK,
              stroke = FALSE, smoothFactor = 0.2, fillOpacity = 0.3,
              fillColor = ~mypal(mydf$value),
              popup = paste("Region: ", UK$NAME_0, "<br>",
                            "Value: ", mydf$value, "<br>")) %>%
  addLegend(position = "bottomright", pal = mypal, values = mydf$value,
            title = "UK value",
            opacity = 1)


library(raster)
charafr <- c('RWA', 'BDI', 'UGA') 


ac <- list()
for (i in 1:length(charafr)){
  ac[[i]] <- getData('GADM', country=charafr[i], level=0)
}
allac <- do.call("bind", ac)

plot(allac)


charafr <- c('RWA', 'BDI', 'UGA') 
allac2 <- do.call("bind", lapply(charafr, function(x)  getData('GADM', country=x, level=0)))




