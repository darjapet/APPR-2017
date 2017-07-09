library(shiny)

shinyServer(function(input, output){
  output$nekaj <- renderPlot({
    data <- filter(
      drzva == input$drzava,
      leto == input$leto
    )
    graf <- ggplot(data, x = #zaposleni, turisti, y = stevilo
                     )+ geom_col() + ylab("Število oseb")
  })
})