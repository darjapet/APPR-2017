library(shiny)

shinyServer(function(input, output){
  output$graf <- renderPlot({
    if (input$osebe == "Gosti") {
      data <- (tabela2 %>% filter(drzava == input$drzava) %>% group_by(leto) %>%
                 summarise(stevilo = sum(stevilo_gostov, na.rm = TRUE)))
    } else {   
      data <- (tabela3 %>% filter(drzava == input$drzava) %>% group_by(leto) %>%
                 summarise(stevilo = sum(stevilo_zaposlenih, na.rm = TRUE)))
    }
    ggplot(data, aes(x = factor(leto), y = stevilo)) + geom_col() +
      xlab("Leto") + ylab("Število oseb")
  })})