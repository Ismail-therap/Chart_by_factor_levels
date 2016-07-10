library(shiny)
require(shinysky)
library(googleVis)

source("Service/Creating_gvis_line_chart.R")

dat <- "Data/obiee_dms_use.csv"



target_col1<-"V2"
target_col2<-"V3"
target_col3<-"V5"


shinyServer(function(input,output) {
  
    category_1 <- get_box(data_file=dat,target_col=target_col1)
    category_2 <- get_box(data_file=dat,target_col=target_col2)
    category_3 <- get_box(data_file=dat,target_col=target_col3)
    
    
    output$category1 <- renderUI({
      selectInput("cat1", "Choose Category", choices  = category_1 ,selected = "Oracle_BI_DB_Connection_Pool")
    })
    output$category2 <- renderUI({
      selectInput("cat2", "Choose Category", choices  = category_2, selected = "Oracle_BI_PS_Sessions")
    })
    
    output$category3 <- renderUI({
      selectInput("cat3", "Choose Category", choices  = category_3, selected = "Accumulated_Open_Connection")
    })
    

    # observe({
    #   print(input$cat1)
    # 
    # })
    
    l_chart <- reactive({
      gvis_line_chart(data_file=dat,factor_level1=input$cat1, factor_level2 = input$cat2, factor_level3 = input$cat3)
    })
    
    output$plot<- renderGvis({l_chart()
        
      })
    
      
    # output$text1 <- renderText({ 
    #   input$cat1
    # })
    #        
          
    
}

)



