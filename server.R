#Preparation

library(devtools)
library(shiny)
library(ggplot2)
data(iris)

#start

shinyServer(function(input, output)
  {
  
  output$var1 <- renderText({ 
    paste("The Specie you have selected:  ",input$var1)

  })
  
  
  output$var2 <- renderText({ 
    paste("The type you have selected:  ",input$var2)
    
  })
  
      output$summ <- renderTable({
      plotdata <- switch(input$var1, 
                     "Setosa" = iris[which(iris$Species=='setosa'),],
                     "Versicolor" = iris[which(iris$Species=='versicolor'),],
                     "Virginica" = iris[which(iris$Species=='virginica'),])
      summary(plotdata[,c(1,2,3,4)])
      })
  
  output$plot2 <- renderPlot({
    data2 <- switch(input$var2, 
                       "Sepal" = iris[,c(1,2,5)],
                       "Petal" = iris[,c(3,4,5)])
     ggplot(data2, aes(data2[,1], data2[,2]))+geom_point(aes(colour = data2$Species))
    qplot(y=data2[,1],x=data2[,2],data=data2,color=data2$Species,xlab='Length',ylab='Width',lengend.title="Species")
  
}
)
})