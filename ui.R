library(leaflet)
library(ShinyDash)

shinyUI(fluidPage(
    tags$head(tags$link(rel='stylesheet', type='text/css', href='styles.css')),
    leafletMap(
        "map", "100%", 400,
        initialTileLayer = "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        options=list(
            center = c(0, 0),
            zoom = 3
        )
    ),

    hr(),
    fluidRow(
        column(3,
               selectInput('variable',
                           label = 'Variable',
                           choices = list('depth', 'mag'),
                           selected = 'depth'),
               dateRangeInput('date', 'dateRange', start = '2014-12-01', end = '2015-01-02')
        )
    )
))