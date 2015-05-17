shinyUI(pageWithSidebar(
  headerPanel("Regression calculator"),
  
  sidebarPanel(
    helpText("Enter two comma-separated lists of numbers and press submit to see the values fitted with a linear model and then graphed. Both lists must have the same number of entries."),
    textInput('xvals', 'Enter a list of numbers separated by commas', value="0,1,2,3,4,5"),
    textInput('yvals', 'Enter values for the corresponding y values', value="0,2,4,6,8,10"),
    
    submitButton('Submit')
  ),
  
  mainPanel(
    h1('Input'),
    dataTableOutput("dataTable"),
    h1("Regression results"),
    h4('Slope'),
    verbatimTextOutput("slope"),
    h4('Intercept'),
    verbatimTextOutput("intercept"),
    plotOutput('xyline'),
    plotOutput('fitplot')
  )
  
))