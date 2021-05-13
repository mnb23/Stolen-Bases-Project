library(stringr)

#Try Catch Function for Importing Files (Florida Marlins vs Miami Marlins)
dataInput = function(fileName) {
  out = tryCatch({
    read.table(
      fileName,
      header = FALSE,
      sep = ",",
      col.names = paste0("V", seq_len(7)),
      fill = TRUE,
      stringsAsFactors = FALSE
    )
  },
  
  # Handler when a warning occurs:
  warning = function(cond) {
    message(paste("Reading the file caused a warning:", fileName))
    message("Here's the original warning message:")
    message(cond)
    
    # Choose a return value when such a type of condition occurs
    return(NULL)
  },
  
  # Handler when an error occurs:
  error = function(cond) {
    message(paste("This seems to be an invalid file:", fileName))
    message("Here's the original error message:")
    message(cond)
    
    # Choose a return value when such a type of condition occurs
    return(NA)
  },
  
  finally = {
    message(paste("Processed file:", fileName))
  })
  return(out)
}


teamname = c(
  'ANA',
  'ARI',
  'ATL',
  'BAL',
  'BOS',
  'CHA',
  'CHN',
  'CIN',
  'CLE',
  'COL',
  'DET',
  'FLO', #Until 2011
  'HOU',
  'KCA',
  'LAN',
  'MIA', #2012 Onwards
  'MIL',
  'MIN',
  'NYA',
  'NYN',
  'OAK',
  'PHI',
  'PIT',
  'SDN',
  'SEA',
  'SFN',
  'SLN',
  'TBA',
  'TEX',
  'TOR',
  'WAS'
)

#Data Frame for pitch number of stolen bases
nSteal = data.frame(
  Date = character(),
  pitcher = character(),
  team = character(),
  stolenBasePitch = integer(),
  stringsAsFactors = FALSE
)

#Which events count as pitches in Retrosheet Event Data

pitchCounts = c('C', 'S', 'B', 'F', 'X', 'T', 'H', 'L', 'M', 'P', 'K', 'U', 'Q', 'R')

allPitchers = data.frame(
  pitcherID = character(),
  pitcherName = character(),
  pitcherTeam = character(),
  stringsAsFactors = FALSE
)


locFile = '/Users/mannyb/Documents/R Workspaces/Baseball Projects/Pitch by Pitch Data/'

for (year in 2008:2020) {
  folderName = paste(year, 'eve', '/', sep = '')
  
  for (team in teamname) {
    fileName = paste(year, team, '.txt', sep = '')
    csvFileInput = paste(locFile, folderName, fileName, sep = '')
    
    pitch_by_pitch = dataInput(csvFileInput)
    
    
    if (is.null(pitch_by_pitch) == FALSE) {
      pitcher = ''
      pitch_count = 0
      dateGame = ''
      
      homeAway = 2
      
      #Home Team or Away Team (necessary for going through event file)
      for (i in 1:nrow(pitch_by_pitch)) {
        if (pitch_by_pitch$V1[i] == 'id') {
          teamGame = substr(pitch_by_pitch$V2[i], 1, 3)
          if (teamGame == team) {
            homeAway = 1
          }
          
          else{
            homeAway = 0
          }
        }
        
        #Finding Pitcher and Game Date
        
        if (pitch_by_pitch$V1[i] == 'info' &&
            pitch_by_pitch$V2[i] == 'date') {
          dateGame = toString(pitch_by_pitch$V3[i])
        }
        
        if (pitch_by_pitch$V6[i] == 1 &
            pitch_by_pitch$V4[i] == homeAway) {
          pitcher = pitch_by_pitch$V2[i]
          pitch_count = 0
          
          allPitchers[nrow(allPitchers) + 1, ] = c(pitcher, pitch_by_pitch$V3[i], team)
        }
        
        #Finding Stolen Base
        
        if (pitch_by_pitch$V1[i] == 'play') {
          inning = pitch_by_pitch$V2[i]
          locPeriod = max(unlist(gregexpr(pattern = "\\.", pitch_by_pitch$V6[i])))
          sequence = substr(pitch_by_pitch$V6[i], locPeriod + 1, 1000)
          
          if (locPeriod != -1) {
            plays = pitch_by_pitch$V7[i - 1]
            if (str_detect(plays, "SB") &
                pitch_by_pitch$V3[i] != homeAway) {
              nSteal[nrow(nSteal) + 1,] = c(dateGame, pitcher, team, pitch_count)
            }
            
          }
          numPitches = sum(str_count(sequence, pitchCounts))
          
          if (pitch_by_pitch$V3[i] != homeAway) {
            pitch_count = pitch_count + numPitches
            
          }
          
        }
      }
    }
    
  }
}

library(plyr)

#Finding Pitcher Names

pitcherNamesDf = count(allPitchers,vars=c('pitcherID','pitcherName','pitcherTeam'))

write.csv(nSteal,
          "/Users/mannyb/Documents/R Workspaces/Baseball Projects/Stolen Base Pitch Number.csv",
          row.names = FALSE)

write.csv(pitcherNamesDf,
          "/Users/mannyb/Documents/R Workspaces/Baseball Projects/Pitcher Names.csv",
          row.names = FALSE)

