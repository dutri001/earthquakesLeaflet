library(leaflet)
library(ShinyDash)

shinyUI(fluidPage(
    tags$head(tags$link(rel='stylesheet', type='text/css', href='styles.css')),
    leafletMap(
        "map", "100%", 800,
        initialTileLayer = "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        options=list(
            center = c(0, 0),
            zoom = 3
        )
    ),


    absolutePanel(id = "controls", class = "modal", fixed = TRUE, draggable = TRUE,
                  top = 60, left = "auto", right = 20, bottom = "auto",
                  width = 330, height = "auto",
                  
                  h3("Real time earthquakes"),
                  h4(em("USGS database")),
                  
                  selectInput('variable',
                              label = 'Variable',
                              choices = list('depth', 'mag'),
                              selected = 'depth'),
                  dateRangeInput('date', 'dateRange', start = '2014-12-01', end = '2015-01-02'),
                  plotOutput("hist", height = 200)
    )
)
)
