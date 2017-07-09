library(shiny)

shinyUI(fluidPage(
  
  titlePanel(title = "Turizem v Evropskih državah"),
  
  sidebarLayout(
    sidebarPanel(("Izberi željene podatke"), 
                 sliderInput(inputId = "leto",
                            label = "Leto",
                            value = 2011, min = 2008, max = 2015,
                            round = TRUE,
                            animate = TRUE),
                 selectInput("drzava", "Država:", choices = c(slovar[tabela3$drzava]), 
                             multiple = FALSE)),
    
    mainPanel(("tukaj bodo podatki")
                      )
)))
