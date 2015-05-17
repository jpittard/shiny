

shinyServer(
  
  function(input, output) {  
    x <- reactive(as.numeric(unlist(strsplit(input$xvals, ","))))
    y <- reactive(as.numeric(unlist(strsplit(input$yvals, ","))))
    fit <- reactive(lm(y() ~ x()))
    
    output$xyline <- renderPlot({ 
      plot(x(), y(), xlab = "x", ylab = "y", type = "l")
      abline(fit(), col="red")
    })
    
    output$fitplot <- renderPlot({
      layout(matrix(c(1,2,3,4),2,2))
      plot(fit())
    })
    
    output$dataTable <- renderDataTable({data.frame(x(),y())})
    
    output$slope <- renderText({coefficients(fit())[2]})
    output$intercept <- renderText({coefficients(fit())[1]})     
    
  }
)