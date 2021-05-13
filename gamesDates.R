allDate = c()

for (i in 2008:2020){
  
  if (i == 2020){
    
    fileName = "/Users/mannyb/Downloads/schedule/2020REV.TXT"
  }
  
  else{
    
    dateName = paste(toString(i),"SKED.TXT",sep="")
    fileName = paste("/Users/mannyb/Downloads/schedule/",dateName,sep="")
  }
  
  dates = read.delim(fileName,sep=",",header=FALSE,stringsAsFactors=FALSE)
  dates2 = dates[dates$V11=="",]
  finalDates = paste(substr(dates2$V1,1,4),substr(dates2$V1,5,6),substr(dates2$V1,7,8),sep="-")
  allDate = c(allDate,finalDates)
}

allDates = unique(allDate)
remove = c("\032--")
allDates = allDates[!allDates %in% remove]


startDates = c()
endDates = c()
i = 1

while(i < length(allDates)){
  
  startDate = allDates[i]
  endDate = as.character(as.Date(startDate)+7)
  startDates=c(startDates,startDate)
  endDates = c(endDates, endDate)
  i = max(which(allDates<=as.Date(endDate)))+1
  
}


dateMatrix = data.frame(as.Date(startDates),as.Date(endDates),stringsAsFactors = FALSE)

names(dateMatrix) = c("start_date", "end_date")

write.csv(dateMatrix,"/Users/mannyb/Downloads/dateExport.csv", row.names = FALSE)
