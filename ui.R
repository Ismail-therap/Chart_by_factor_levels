

shinyUI(fluidPage(
  
  fluidRow(
    tags$h4("Select Category :"),
    
    column(2,
           
           uiOutput("category1",container = tags$li)  
           
    ),
    
    column(2,
           
           uiOutput("category2",container = tags$li)  
           
    ),
    column(2,
           
           uiOutput("category3",container = tags$li)  
           
    )
    ,
    column(5,
           #conditionalPanel(condition="input.cat[1]", h4("Attendance")),
           htmlOutput("plot")

    )
  )
))

