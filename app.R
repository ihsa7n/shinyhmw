
library(shiny)
library(ggplot2)
library(datasets)


mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))



ui <- fluidPage(
  
  
  titlePanel("Miles Per Gallon"),
  
 
  sidebarLayout(
    
    
    sidebarPanel(
      
      
      selectInput("variable", "Variable:",
                  c("Cylinders" = "cyl",
                    "Transmission" = "am",
                    "Gears" = "gear"))
      
      
    ),
    
    
  
    mainPanel(
      
     
      h3(textOutput("caption")),
      
      
      plotOutput("mpgPlot")
      
    )
  )
)


server <- function(input, output) {
  
 
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  
  output$caption <- renderText({
    formulaText()
  })
  
 
  
  
  
  
  output$mpgPlot <- renderPlot({
    ggplot( mtcars, aes(mpg), outline = input$outliers) + 
      geom_histogram(binwidth=5,col="white", fill="steelblue") + 
      facet_wrap(~mpgData[[input$variable]], nrow = 3)
    
  })
  
}


shinyApp(ui, server)



ui <- fluidPage(
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)









