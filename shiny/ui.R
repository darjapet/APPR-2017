library(shiny)

shinyUI(fluidPage(
  
  titlePanel(title = "Turizem v Evropskih državah"),
  
  sidebarLayout(
    sidebarPanel(("Izberi željene podatke"), 
                 sliderInput(inputId = "num",
                            label = "Leto",
                            value = 2011, min = 2008, max = 2015,
                            round = TRUE,
                            animate = TRUE),
                 selectInput("država", "Država:", choices = c(slovar[tabela3$drzava]), 
                             multiple = FALSE),
                 selectInput("podatki", "Kaj želim vedeti", 
                             choices = c("Zaposleni", "Gosti"))),
    
    mainPanel(("tukaj bodo podatki")
                      )
)))
