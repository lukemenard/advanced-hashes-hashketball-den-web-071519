require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1         
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7         
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15         
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5         
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1         
        }
      }  
    },
  
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2         
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10         
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5         
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0  
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  points = []
  game_hash.each do |home_away, level_one_keys|
    #binding.pry
    level_one_keys.each do |players_key, level_two_keys|
      #binding.pry
      if players_key == :players
        #binding.pry
        level_two_keys.each do |player_name, stats|
          stats.each do |key, value|
          #binding.pry
            if player_name == name && key == :points
            #binding.pry
              points << value

            end
          end
        end
      end
    end
  end
  return points[0]
end

def shoe_size(name)
  game_hash
  shoe_size = 0
  game_hash.each do |home_away, level_one_keys|
    #binding.pry
    level_one_keys.each do |players_key, level_two_keys|
      #binding.pry
      if players_key == :players
        #binding.pry
        level_two_keys.each do |player_name, stats|
          #binding.pry
          if player_name == name
            #binding.pry
            stats.each do |key, value|
              if key == :shoe
                shoe_size = value
                #binding.pry
                return shoe_size
              end
             end
           end
         end
       end
     end
   end
   shoe_size
 end

def team_colors(team_name)
  colors = []
  game_hash.each do |home_away, level_one_keys|
    level_one_keys.each do |players_key, level_two_keys|
      if level_two_keys == team_name
        colors << game_hash[home_away][:colors]
      end
    end
  end
  colors.flatten
end

def team_names
  names = []
  game_hash.each do |home_away, level_one_keys|
    level_one_keys.each do |players_key, level_two_keys|
      if players_key == :team_name
        names << level_two_keys
      end
    end
  end
  names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |home_away, level_one_keys|
    if game_hash[home_away].values.include?(team)
      level_one_keys.each do |players_key, level_two_keys|
        if level_two_keys.class == Hash
          level_two_keys.each do |player_name, stats|
            stats.each do |key, value|
              if key == :number
                numbers << value
              #binding.pry
              end
            end
          end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  points_stat = nil
  game_hash.each do |home_away, level_one_keys|
    level_one_keys.each do |players_key, level_two_keys|
      if players_key == :players
        level_two_keys.each do |player_name, stats|
          stats.each do |stat_name, stat_value|
            if player_name == name
              points_stat = game_hash[home_away][:players][player_name]
            end
          end
        end
      end
    end
  end
  points_stat
end

def big_shoe_rebounds
  player = ""
  shoe_size = 0
  game_hash.each do |home_away, level_one_keys|
    level_one_keys.each do |players_key, level_two_keys|
      if level_two_keys.class == Hash
        level_two_keys.each do |player_name, stats|
          stats.each do |key, value|
            if key == :shoe
              if value > shoe_size
                shoe_size = value
                player = player_name
              end
            end
          end
        end
        return game_hash[home_away][players_key][player][:rebounds]
      end
    end
  end
end
  
def most_points_scored
  player = ""
  max_points = 0
  game_hash.each do |home_away, level_one_keys|
    level_one_keys.each do |players_key, level_two_keys|
      if level_two_keys.class == Hash
        level_two_keys.each do |player_name, stats|
          stats.each do |key, value|
            if key == :points
              if value > max_points
                max_points = value
                player = player_name
              end
            end
          end
        end
      end
    end
  end
  player
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |player, points|
    home_points += points[:points]
  end
  game_hash[:away][:players].each do |player, points|
    away_points += points[:points]
  end
  if home_points > away_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end
        
def player_with_longest_name
  players_name = ""
  game_hash.each do |home_away, level_one_keys|
    #binding.pry
    level_one_keys.each do |players_key, level_two_keys|
      #binding.pry
      if players_key == :players
        level_two_keys.each do |player_name, stats|
          #binding.pry
          if player_name.length > players_name.length
            players_name = player_name
            #binding.pry
          end
        end
      end
    end
  end
  return players_name
end
  
def long_name_steals_a_ton?
  steal_name = ""
  steal_count = 0
  game_hash.each do |home_away, level_one_keys|
    #binding.pry
    level_one_keys.each do |players_key, level_two_keys|
      #binding.pry
      if players_key == :players
        #binding.pry
        level_two_keys.each do |player_name, stats|
          #binding.pry
          stats.each do |key, value|
            if key == :steals
              if value > steal_count
                steal_count = value 
                steal_name = player_name
              end
            end
          end
        end
      end
    end
  end
  steal_name == player_with_longest_name
end
