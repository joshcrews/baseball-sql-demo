class PlayersSeason < ActiveRecord::Base
  belongs_to :team_season
  belongs_to :player
end
