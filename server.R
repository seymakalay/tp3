
#https://datascience-enthusiast.com/R/shiny_ML.html
#https://github.com/ismyrnow/leaflet-groupedlayercontrol

function(input, output) {
  
  
 
  
  
  ##################################################### 
   output$dt <- 
      DT::renderDataTable(
        datatable(data_table,  options = list(pageLength = 20),
                  filter = "top"), server = T)
  
#   output$filtered_row <- 
#      renderPrint({input[["dt_rows_all"]]})
  
#   output$download_filtered <- 
#      downloadHandler(
#        filename = "Filtered Data.csv",
#        filename = function() {
#          paste('filtered data-', Sys.Date(), '.csv', sep = '')},
#         content = function(file){ write.csv(data_table[input[["dt_rows_all"]], ],file)})
  
  
  
  #####################################################
  
  output$pivot <- renderRpivotTable({
    rpivotTable(data =   dfpivot,  
                rows = "Cluster.No",
                cols = c("Loan.Type", "multi.level"),
                #vals = "Freq", aggregatorName = "Count", rendererName = "Table", subtotals = TRUE) # use this or below line
                #aggregatorName = "Sum as Fraction of Columns", vals = "Freq", rendererName = "Table Barchart")
                aggregatorName = "Sum as Fraction of Rows", vals = "Cluster.No", rendererName = "Table With Subtotal")
    #width="200%", height="600px")
    
  })
  
  
  #####################################################
  output$mymap2 <- renderLeaflet({ 
    leaflet() %>% 
      #addProviderTiles("OpenStreetMap.Mapnik") %>%
      addTiles(group = "OSM") %>% 
      addProviderTiles("CartoDB", group = "Carto") %>% 
      addProviderTiles("Esri", group = "Esri") %>% 
      #setView(lat = 55, lng = -3, zoom = 6) %>%
      
      # addPolygons(data = CHN,
      #              stroke = FALSE, smoothFactor = 0.2, fillOpacity = 0.3,
      #              fillColor = ~mypal(mydf$n), group = "All",
      #              popup = paste("Region: ", CHN$NAME_1, "<br>",
      #                            "Value: ", mydf$n, "<br>")) %>%
      
      #  addLegend(position = "bottomright", pal = mypal, values = mydf$n,
      #            title = "All", opacity = 1) %>%
      
    addPolygons(data = CHN,
                stroke = FALSE, smoothFactor = 0.2, fillOpacity = 0.3,
                fillColor = ~mypal1(mydf1$n), group = "Cluster 1",
                popup = paste("Region: ", CHN$NAME_1, "<br>",
                              "Value: ", mydf1$n, "<br>")) %>%
      
      addLegend(position = "bottomright", pal = mypal1, values = mydf1$n,
                title = "Cluster 1", opacity = 1) %>%
      
      #addLegend(position = "bottomright", pal = mypal1, values = mydf1$n,
      #          title = "Distribution", opacity = 1) %>%
      
      
      addPolygons(data = CHN,
                  stroke = FALSE, smoothFactor = 0.2, fillOpacity = 0.3,
                  fillColor = ~mypal2(mydf2$n), group = "Cluster 2&3",
                  popup = paste("Region: ", CHN$NAME_1, "<br>",
                                "Value: ", mydf2$n, "<br>")) %>%
      
      addLegend(position = "bottomright", pal = mypal2, values = mydf2$n,
               title = "Cluster 2&3", opacity = 1) %>%
      
      
      addMiniMap(position = "bottomleft", width = 400, height = 250,tiles = providers$Esri.WorldStreetMap,  toggleDisplay = TRUE)  %>%
      
      leaflet.extras::addSearchOSM() %>% 
      leaflet.extras::addReverseSearchOSM() %>% 
      leaflet.extras::addResetMapButton() %>%
      
      addLayersControl(baseGroups = c("OSM", "Carto", "Esri") ,  overlayGroups = c("Cluster 1", "Cluster 2&3")) #c("Cluster 1", "Cluster 2&3")) #"All"  "Distribution"
    # options = layersControlOptions(collapsed = FALSE))
    
  })
  
   
  
  
}

