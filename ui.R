
shinyUI(fluidPage(
  titlePanel("Summary and Patterns for different IRIS species"),
  sidebarLayout(
    sidebarPanel(
      helpText("Instruction "), 
      includeMarkdown("README.Rmd"),
      selectInput("var1", 
                  label = "Choose a specie you are interested",
                  choices = c("Setosa", "Versicolor","Virginica"), 
                  selected = "Setosa"
                  ),
      selectInput("var2", 
                  label = "Choose Petal/Sepal for graph",
                  choices = c("Petal", "Sepal"), 
                  selected = "Petal"
      )
      ),
      mainPanel(
      h3(textOutput('var1')),
      p('This is the summary :'),
      tableOutput('summ'),
      h3(textOutput('var2')),
      p('This is the plot by different species: '),
      plotOutput('plot2',width=600,height=350)
#       h4("To get insturction on how to use this App please see:"),
#       includeMarkdown("README.Rmd")
               )
     )))