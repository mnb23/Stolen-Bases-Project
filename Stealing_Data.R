require(readr)
require(dplyr)
require(xml2)
require(magrittr)

dates_reduced <- read_csv("/Users/mannyb/Downloads/dateExport.csv")

x2008season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2008)

x2009season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2009)

x2010season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2010)

x2011season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2011)

x2012season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2012)

x2013season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2013)

x2014season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2014)

x2015season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2015)

x2016season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2016)

x2017season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2017)

x2018season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2018)

x2019season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2019)

x2020season <- dates_reduced %>%
  filter(substr(start_date, 1, 4) == 2020)



x2008data = data.frame()
for (i in (1:nrow(x2008season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2008season$start_date[i], x2008season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2008data = rbind(x2008data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2009data = data.frame()
for (i in (1:nrow(x2009season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2009season$start_date[i], x2009season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2009data = rbind(x2009data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2010data = data.frame()
for (i in (1:nrow(x2010season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2010season$start_date[i], x2010season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2010data = rbind(x2010data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2011data = data.frame()
for (i in (1:nrow(x2011season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2011season$start_date[i], x2011season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2011data = rbind(x2011data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2012data = data.frame()
for (i in (1:nrow(x2012season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2012season$start_date[i], x2012season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2012data = rbind(x2012data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2013data = data.frame()
for (i in (1:nrow(x2013season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2013season$start_date[i], x2013season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2013data = rbind(x2013data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2014data = data.frame()
for (i in (1:nrow(x2014season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2014season$start_date[i], x2014season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2014data = rbind(x2014data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2015data = data.frame()
for (i in (1:nrow(x2015season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2015season$start_date[i], x2015season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2015data = rbind(x2015data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2016data = data.frame()
for (i in (1:nrow(x2016season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2016season$start_date[i], x2016season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2016data = rbind(x2016data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2017data = data.frame()
for (i in (1:nrow(x2017season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2017season$start_date[i], x2017season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2017data = rbind(x2017data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2018data = data.frame()
for (i in (1:nrow(x2018season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2018season$start_date[i], x2018season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2018data = rbind(x2018data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2019data = data.frame()
for (i in (1:nrow(x2019season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2019season$start_date[i], x2019season$end_date[i])
  ))
  if (inherits(data, "try-error"))
  {
    #error handling code, maybe just skip this iteration using
    next
  }
  
  x2019data = rbind(x2019data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

x2020data = data.frame()
for (i in (1:nrow(x2020season))) {
  data = try(as.data.frame(
    baseballr::scrape_statcast_savant_pitcher_all(x2020season$start_date[i], x2020season$end_date[i])
  ))
  
  if (inherits(data, "try-error"))
  {
    next
  }
  
  x2020data = rbind(x2020data, data)
  Sys.sleep(sample(x = runif(20, min = .01, max = 1), size = 1))
  
}

write.csv(x2008data,
          "/Users/mannyb/Documents/Stolen Base Project/2008Data.csv",
          row.names = FALSE)
write.csv(x2009data,
          "/Users/mannyb/Documents/Stolen Base Project/2009Data.csv",
          row.names = FALSE)
write.csv(x2010data,
          "/Users/mannyb/Documents/Stolen Base Project/2010Data.csv",
          row.names = FALSE)
write.csv(x2011data,
          "/Users/mannyb/Documents/Stolen Base Project/2011Data.csv",
          row.names = FALSE)
write.csv(x2012data,
          "/Users/mannyb/Documents/Stolen Base Project/2012Data.csv",
          row.names = FALSE)
write.csv(x2013data,
          "/Users/mannyb/Documents/Stolen Base Project/2013Data.csv",
          row.names = FALSE)
write.csv(x2014data,
          "/Users/mannyb/Documents/Stolen Base Project/2014Data.csv",
          row.names = FALSE)
write.csv(x2015data,
          "/Users/mannyb/Documents/Stolen Base Project/2015Data.csv",
          row.names = FALSE)
write.csv(x2016data,
          "/Users/mannyb/Documents/Stolen Base Project/2016Data.csv",
          row.names = FALSE)
write.csv(x2017data,
          "/Users/mannyb/Documents/Stolen Base Project/2017Data.csv",
          row.names = FALSE)
write.csv(x2018data,
          "/Users/mannyb/Documents/Stolen Base Project/2018Data.csv",
          row.names = FALSE)
write.csv(x2019data,
          "/Users/mannyb/Documents/Stolen Base Project/2019Data.csv",
          row.names = FALSE)
write.csv(x2020data,
          "/Users/mannyb/Documents/Stolen Base Project/2020Data.csv",
          row.names = FALSE)
