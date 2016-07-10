

source("Model/Get_subsetted_data_by_factor_levels.R")



gvis_line_chart <- function (data_file,factor_level1, factor_level2,factor_level3) {
  if( is.null(factor_level1)  | is.null(factor_level2) | is.null(factor_level3) ){
    return()
  }
  
  library(googleVis)
  
  hght <- 400
  wdth <- 750
  
  opt= list(
    
    vAxes="[{title:'Measure',             
    titleTextStyle:{color:'black',fontsize:19}}]",
    hAxes="[{title:'Time',
    titleTextStyle:{color:'black',fontsize:19}}]",
    height = hght, width = wdth,lineWidth=2,
    title="",
    titleTextStyle="{color:'black',fontName:'Courier',fontSize:21}",
    titlePosition="out",backgroundColor="#F5F5F5")
  
  
  fdat <- subsetting_the_data(data_file,factor_level1, factor_level2,factor_level3)
  
  line = gvisLineChart(fdat,xvar='Time',yvar='Measurement',options = opt)  
  
  return(line)
  
  }

#############################
#gvis_line_chart(factor_level1="Oracle_BI_DB_Connection_Pool",factor_level2==,factor_level3==)


