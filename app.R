#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
data<- read.csv("http://cs.newpaltz.edu/~easwaran/DA/Data/sample.csv")
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Exploring Different Numbers of  Bins in Histograms"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 10,
                        max = 300,
                        value = 20)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
      
     ggplot(data, aes(v))+geom_histogram(bins=input$bins, col="white", fill="red")
   
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
