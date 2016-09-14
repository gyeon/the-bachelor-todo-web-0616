require 'pry'

def get_first_name_of_season_winner(data, season)
  #iterate through the data and given season to find the winner
  #since season is a key of data, you can iterate through the specific one to find the winner
  data[season].each do |season_hash, value|
    # you get an array of hashes with contestant info
    # then you have to iterate through the hash again
    season_hash.each do |info, answer|
      #check to see if the answer/value == winner, if so, return the first name
      if answer == "Winner"
        return season_hash["name"].split.first
      end
    end
  end
end

def get_contestant_name(data, occupation)
  #iterate through the data and find the contestant with the occupation
  data.each do |season, contestants|
    #then iterate through the contestants to get info
    contestants.each do |info, answer|
      if info["occupation"] == occupation
        return info["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, contestants|
    contestants.each do |info, answer|
      if info["hometown"] == hometown
        count += 1
      end
    end
  end
  return count
end

def get_occupation(data, hometown)
  #It returns the occupation of the first contestant who hails from that hometown.
  data.each do |season, contestants|
    contestants.each do |info, answers|
      if info["hometown"] == hometown
        return info["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  #how do you get an average: take the total added number, and divide by number of things
  #start with 0 for each
  num_of_contestants = 0
  total_age = 0
  #iterate through the specific season
  data[season].each do |season_hash|
    #find the key of age --> season_hash[age] and add the value to the total_age, while increasing contestant count
    num_of_contestants += 1
    total_age += season_hash["age"].to_f #float
  end
  return (total_age/num_of_contestants).round
end

Pry.start
