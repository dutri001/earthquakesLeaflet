library(leaflet)
library(ggplot2)
library(maps)

data <- readRDS('data/earthquake.rds')

shinyServer(function(input, output, session) {
    
#     dataInput <- reactive({
#         subset(data,select = input$variable)
#     })
    
    column <- reactive({
        input$variable
    })
    
    map <- createLeafletMap(session, "map")
    
    observe({
        map$clearShapes()
        map$addCircleMarker(data$latitude,
                      data$longitude,
                      data[,column()] / max(data[,column()]) * 10,
                      row.names(data))
    })
    
})