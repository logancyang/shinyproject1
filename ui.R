## ui.R for the shiny app project: mtcars mpg prediction from wt, hp and am
shinyUI(
        pageWithSidebar(
                # Application title 
                headerPanel("MPG prediction for Vehicles"),
                
                sidebarPanel(
                        radioButtons("AM", "Transmission type:",
                                     list("Automatic" = "0",
                                          "Manual" = "1")),
                        sliderInput('WT', 'Set weight (lb/1000)',value = 4, min = 1.5, max = 5.5, step = 0.02),
                        sliderInput('HP', 'Set horsepower (HP)',value = 100, min = 50, max = 400, step = 5),
                        submitButton('Submit and Predict'),
                        br(),
                        br(),
                        p("This app loads the data set 'mtcars' and trains a linear model with 3 variables, 
                          transmisson, horsepower and weight. There are 3 tabs of output, prediction,
                          plot and summary. Prediction gives the predicted value and a 95% confidence interval.
                          Plot and summary show the fitting information of the linear model."),
                        img(src = "benz.jpg", height = 200, width = 200)
                ), 
                mainPanel(
                        h3('Results of prediction'),
                        h4('You entered'), 
                        verbatimTextOutput("inputValue"), 
                        #h4('Prediction Results'), 
                        #verbatimTextOutput("prediction"),
                        tabsetPanel(
                                tabPanel("Prediction", verbatimTextOutput("prediction")),
                                tabPanel("Plot", plotOutput("plot")), 
                                tabPanel("Summary", verbatimTextOutput("summary")) 
                        )
                )
        )
)
