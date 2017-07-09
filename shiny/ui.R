library(shiny)

shinyUI(fluidPage(
  
  titlePanel(title = "Turizem v Evropskih državah"),
  
  sidebarLayout(
    sidebarPanel(("Izberi željene podatke"), 
                 selectInput("osebe", "", choices = c("Zaposleni", "Gosti")),
                 selectInput("drzava", "Država:", choices = c("Francija" = "France", 
                                                              "Italija" = "Italy", 
                                                              "Španija" = "Spain", 
                                                              "Nemčija" = "Germany", 
                                                              "Avstrija" = "Austria", 
                                                              "Velika Brtanija" = "United Kingdom", 
                                                              "Nizozemska" = "Netherlands",
                                                              "Hrvaška" = "Croatia",
                                                              "Grčija" = "Greece", 
                                                              "Poljska"= "Poland",
                                                              "Belgija" = "Belgium",
                                                              "Bolgarija" = "Bulgaria",
                                                              "Češka" = "Czech Republic",
                                                              "Danska" = "Denmark",
                                                              "Nemčija" = "Germany (until 1990 former territory of the FRG)",
                                                              "Estonija" = "Estonia",
                                                              "Irska" = "Ireland",
                                                              "Francija" = "France",
                                                              "Ciper" = "Cyprus",
                                                              "Latvija" = "Latvia",
                                                              "Litva" = "Lithuania",
                                                              "Luksembourg" = "Luxembourg",
                                                              "Madžarska" = "Hungary",
                                                              "Malta" = "Matlta",
                                                              "Nizozemska" = "Netherlands",
                                                              "Portugalska" = "Portugal",
                                                              "Romunija"= "Romania",
                                                              "Slovenija" = "Slovenia",
                                                              "Slovaška" = "Slovakia",
                                                              "Finska" = "Finland",
                                                              "Švedska" = "Sweden",
                                                              "Islandija" = "Iceland",
                                                              "Lihtenstein" = "Liechtenstein",
                                                              "Norveška" = "Norway",
                                                              "Švica" = "Switzerland",
                                                              "Črna gora" = "Montenegro",
                                                              "Makedonija" = "Former Yugoslav Republic of Macedonia, the",
                                                              "Srbija" = "Serbia",
                                                              "Turčija" = "Turkey"), 
                             multiple = FALSE)),
    
    mainPanel(("tukaj bodo podatki"), plotOutput("graf")
                      )
)))
