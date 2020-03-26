require 'pry'

def game_hash
   {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
        {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
        {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      {
      :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
    },
      {
      :player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
    }
  ]
    },

    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
        {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks =>10
      },
        {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
        {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
        {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
      ]
    }
  }
end

def player_array #array with all players stats - AoH
  player_array = []
  player_array << game_hash[:home][:players]
  player_array << game_hash[:away][:players]
  player_array.flatten
end

def num_points_scored (player_name)
  i = 0
  while i < player_array.length do
    if player_array[i][:player_name] == player_name
      return player_array[i][:points]
    else
      i += 1
    end
  end
end

def shoe_size(player_name)
  i = 0
  while i < player_array.length do
    if player_array[i][:player_name] == player_name
      return player_array[i][:shoe]
    else
      i += 1
    end
  end
end

def team_colors(team_name) #takes a team name and returns an ARRAY of that team colors.
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  new_array = []
  game_hash.each do |place,team|
    new_array << team[:team_name]
  end
  new_array
end

def player_numbers(team_name)
  new_array = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            new_array << player[:number]
          end
        end
      end
    end
  end
  new_array
end

def player_stats(player_name)
  new_hash = {}
  player_array.each do |player|
    if player[:player_name] == player_name
      player.shift
      new_hash = player
    end
  end
  new_hash
end


def big_shoe_rebounds
  player_array.max_by{|k| k[:shoe]}[:player_name]
  binding.pry


end



# def player_attribute(player_name)
#   game_hash.each do |place, team|
#     team.each do |attribute, data|
#     end
#   end
# end

# def num_points_scored(guy)
#   game_hash.each do |place, team|
#     team.each do |attribute, data|
#       # binding.pry
#       if attribute == :players
#         data.each do |athlete|
#           if athlete[:player_name] == guy
#            puts athlete[:points]
#           end
#         end
#       end
#     end
#   end
# end


# def team_names #returns an array of the team names
#   game_hash.map do |place, team|
#     return team[:team_name]
#   end
# end
