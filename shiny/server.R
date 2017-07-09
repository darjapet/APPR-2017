library(shiny)

shinyServer(function(input, output){
  output$graf <- renderPlot({
    data1 <- (tabela2 %>% filter(drzava == input$drzava) %>%
                    summarise(stevilo = sum(stevilo_gostov, na.rm = TRUE)))
             
    data2 <- (tabela3 %>% filter(drzava == input$drzava) %>%
                    summarise(stevilo = sum(stevilo_zaposlenih, na.rm = TRUE)))
    
    ggplot(data, aes(x = leto, y = stevilo)) + geom_col() + xlab("Leto") + ylab("Število oseb")
  })
})