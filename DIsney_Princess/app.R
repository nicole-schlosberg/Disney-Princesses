#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
    title = "Disney Princesses",
    tags$h2("Disney Princesses Redrawn to Reflect Their Actual Age"),
    tags$p(" "),
    sidebarLayout(
        sidebarPanel(
            conditionalPanel( 
                'input.data === "Aladdin"',
                helpText("First we see Disney's original drawing of Jasmine. Below is a redrawn image of her reflecting her actual age.")
            ),
            conditionalPanel( 
                'input.data === "The Little Mermaid"',
                helpText("First we see Disney's original drawing of Ariel. Below is a redrawn image of her reflecting her actual age.")
            ),
            conditionalPanel( 
                'input.data === "Snow White"',
                helpText("First we see Disney's original drawing of Snow White. Below is a redrawn image of her reflecting her actual age.")
            ),
            conditionalPanel( 
                'input.data === "Reference"',
                helpText("Website where you can find these images")
            ),
        ),
        mainPanel(
            tabsetPanel(
                id = 'data',
                tabPanel("Aladdin",
                         plotOutput("Jasmine1"),
                         plotOutput("Jasmine2")
                ),
                tabPanel("The Little Mermaid", 
                         plotOutput("Ariel1"),
                         plotOutput("Ariel2")
                ),
                tabPanel("Snow White", 
                         plotOutput("SnowWhite1"),
                         plotOutput("SnowWhite2")
                ),
                tabPanel("Reference", 
                         verbatimTextOutput("ref")
                )
            )
        )
    )
)

server <- function(input, output) {
    
    output$Jasmine1 <- renderImage({
        list(src = "Jasmine1.png",
             contentType = 'image/png',
             width = 400,
             height = 300)
    }, deleteFile = FALSE)
    output$Jasmine2 <- renderImage({
        list(src = "Jasmine2.png",
             contentType = 'image/png',
             width = 400,
             height = 300)
    }, deleteFile = FALSE)
    
    output$Ariel1 <- renderImage({
        list(src = "Ariel1.png",
             contentType = 'image/png',
             width = 400,
             height = 300)
    }, deleteFile = FALSE)
    output$Ariel2 <- renderImage({
        list(src = "Ariel2.png",
             contentType = 'image/png',
             width = 400,
             height = 300)
    }, deleteFile = FALSE)
    
    output$SnowWhite1 <- renderImage({
        list(src = "SnowWhite1.png",
             contentType = 'image/png',
             width = 400,
             height = 300)
    }, deleteFile = FALSE)
    output$SnowWhite2 <- renderImage({
        list(src = "SnowWhite2.png",
             contentType = 'image/png',
             width = 400,
             height = 300)
    }, deleteFile = FALSE)
    
    output$ref <- renderText({
        print("https://www.awesomeinventions.com/disney-princesses-realistic-ages/")
    })
}

shinyApp(ui, server)