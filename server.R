library(leaflet)
library(ggplot2)
library(maps)
library(dplyr)

data <- readRDS('data/earthquake.rds')

shinyServer(function(input, output, session) {
    
#     dataInput <- reactive({
#         subset(data,select = input$variable)
#     })
    
    column <- reactive({
        input$variable
    })
    
    time <- reactive({
        dplyr::filter(data, date >= input$date[1] & date <= input$date[2])
        
    })
    
    output$hist <- renderPlot({
        hist(time()[,column()],
             main = 'Distribution',
             xlab = input$variable,
             col = '#00DD00',
             border = 'white')
    })
    
    map <- createLeafletMap(session, "map")
    
    observe({
        map$clearShapes()
        map$addCircleMarker(time()$latitude,
                      time()$longitude,
                      time()[,column()] / max(data[,column()]) * 10,
                      row.names(data))
    })
    
})