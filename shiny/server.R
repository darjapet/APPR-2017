library(shiny)

shinyServer(function(input, output){
  output$graf <- renderPlot({
    data <- rbind(tabela2 %>% filter(drzava == input$drzava, leto == input$leto) %>%
                    summarise(stevilo = sum(stevilo_gostov, na.rm = TRUE)) %>%
                    mutate(tip = "gostje"),
                  tabela3 %>% filter(drzava == input$drzava, leto == input$leto) %>%
                    summarise(stevilo = sum(stevilo_zaposlenih, na.rm = TRUE)) %>%
                    mutate(tip = "zaposleni"))
    ggplot(data, aes(x = tip, y = stevilo)) + geom_col() + ylab("Število oseb")
  })
})