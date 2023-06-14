library(shiny)
library(MASS)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("distribution", "Population Distribution:",
                  choices = c("binomial", "negative binomial", "poisson", "normal", "exponential", "uniform", "wishart"),
                  selected = "normal"),
      numericInput("sample_size", "Sample Size (N):", min = 1, max = 100, value = 10),
      numericInput("sampling_times", "Number of Sampling Times:", min = 1, max = 1000, value = 100),
      actionButton("start_sampling", "Start Sampling")
    ),
    mainPanel(
      plotOutput("population_plot"),
      plotOutput("sample_mean_plot")
    )
  )
)

server <- function(input, output) {
  population <- reactive({
    switch(input$distribution,
           "Binomial" = rbinom(1000000, size = 10, prob = 0.5),
           "Negative Binomial" = rnbinom(1000000, size = 10, prob = 0.5),
           "Poisson" = rpois(1000000, lambda = 5),
           "Normal" = rnorm(1000000),
           "Exponential" = rexp(1000000, rate = 1),
           "Uniform" = runif(1000000),
           
    )
  })
  
  output$population_plot <- renderPlot({
    hist(population(), breaks = "FD", main = "Population Histogram",
         xlab = "Population Values", freq = FALSE,
         col = "lightblue", border = "white")
  })
  
  output$sample_mean_plot <- renderPlot({
    sample_means <- replicate(input$sampling_times, mean(sample(population(), input$sample_size)))
    
    hist(sample_means, breaks = "FD", main = "Sampling Means Histogram",
         xlab = "Sample Means", freq = FALSE,
         col = "lightblue", border = "white")
  })
}

shinyApp(ui, server)
