library(shiny)
library(ggplot2)
library(dplyr)

ui <- fluidPage(
  titlePanel("Normal Distribution Analysis"),
  sidebarLayout(
    sidebarPanel(
      numericInput("mean", "Mean:", value = 0),
      numericInput("sd", "Standard Deviation:", value = 1),
      textInput("value1", "Value 1:", placeholder = "-Inf"),
      textInput("value2", "Value 2:", placeholder = "Inf")
    ),
    mainPanel(
      verbatimTextOutput("probability_output"),
      plotOutput("pdf_plot")
    )
  )
)

server <- function(input, output) {
  output$probability_output <- renderPrint({
    mean <- input$mean
    sd <- input$sd
    value1 <- ifelse(input$value1 == "" || input$value1 == "-Inf", -Inf, as.numeric(input$value1))
    value2 <- ifelse(input$value2 == "" || input$value2 == "Inf", Inf, as.numeric(input$value2))
    
    # Calculate the probability of values falling between value1 and value2
    probability <- pnorm(value2, mean, sd) - pnorm(value1, mean, sd)
    
    # Return the probability
    paste("Probability:", probability)
  })
  
  output$pdf_plot <- renderPlot({
    mean <- input$mean
    sd <- input$sd
    value1 <- ifelse(input$value1 == "" || input$value1 == "-Inf", -Inf, as.numeric(input$value1))
    value2 <- ifelse(input$value2 == "" || input$value2 == "Inf", Inf, as.numeric(input$value2))
    
    # Calculate the range of x values
    x <- seq(mean - 3 * sd, mean + 3 * sd, by = 0.01)
    
    # Create a data frame with x values
    df <- data.frame(x = x)
    
    # Calculate the corresponding y values using the normal density function
    df$y <- dnorm(df$x, mean, sd)
    
    # Create a plot with the normal density curve
    plot <- ggplot(df, aes(x = x, y = y)) +
      geom_line() +
      theme_minimal() +
      labs(x = "x", y = "Density", title = "Normal Distribution PDF")
    
    # Shade the area under the curve between value1 and value2
    if (value1 != -Inf && value2 != Inf) {
      plot <- plot +
        geom_area(data = subset(df, x >= value1 & x <= value2), aes(x = x, y = y), fill = "blue", alpha = 0.3)
    } else if (value1 == -Inf && value2 != Inf) {
      plot <- plot +
        geom_area(data = subset(df, x <= value2), aes(x = x, y = y), fill = "blue", alpha = 0.3)
    }
    
    # Display the plot
    plot
  })
}

shinyApp(ui, server)
