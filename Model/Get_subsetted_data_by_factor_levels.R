
get_dat <- function (location="loc") {
  
  dat <- read.csv(location,header=F)
  
  names(dat) [6:7] <- c("Measurement","Time") 
  dat$Measurement <- as.numeric(as.character(dat$Measurement))
  dat$Time = strptime(dat$Time,format='%Y-%m-%d %H:%M:%S')
  
  return(dat)
  
}


######################


get_box <- function(data_file,target_col) {
  data_name <- get_dat(data_file)
  ctgry <- noquote(paste("data_name$",target_col,sep=""))
  uniq_ctgry <- as.character(unique(eval(parse(text=ctgry))))
  return(uniq_ctgry)
  
}

#get_box(data_file=dat,target_col="V2")

#################################
subsetting_the_data <- function (data_file,factor_level1, factor_level2,factor_level3) {
  
  data <- get_dat(data_file)
  subdata <- subset(data, data$V2 == factor_level1 &  data$V3 == factor_level2 & data$V5 == factor_level3)
  #return(head(subdata))
  return(subdata[,6:7])
}




###Outputs
#subsetting_the_data(dat,factor_level1="Oracle_BI_DB_Connection_Pool",factor_level2="ssi_db05_db05_connection",factor_level3="Active_Sessions")

#View(read.csv(dat))





















