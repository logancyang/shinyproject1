library(shiny)
data(mtcars)
shinyServer(
        function(input, output) {
                output$inputValue <- renderPrint({
                        paste0("wt = ", input$WT, ", hp = ", input$HP, ", am = ", input$AM)
                        })
                
                fit3 <- lm(mpg ~ wt + hp + am, mtcars)
                sumCoef <- summary(fit3)$coefficients
                
                output$prediction <- renderPrint({
                        
                        newdata3 <- data.frame(wt = input$WT, hp = input$HP, am = as.numeric(input$AM))
                        pred3 <- predict(fit3, newdata3, interval = ("predict"))
                        if(pred3[2] < 0){
                                pred3[2] = 0
                        }
                        print("MPG Prediction: ")
                        print(pred3[1])
                        print("The confidence interval:") 
                        print(paste0("(", pred3[2], ", ", pred3[3], ")" ))
                })
                
                output$plot <- renderPlot({
                        print("Residual Diagnostics")
                        plot(fit3, which = 1)
                })
                
                output$summary <- renderPrint({
                        print("summary:")
                        summary(fit3)
                })
        } 
)