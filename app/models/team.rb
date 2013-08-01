class Team < ActiveRecord::Base
  belongs_to :league
  has_many :team_seasons
  has_many :players_seasons, :through => :team_seasons
  has_many :players, :through => :players_seasons
end
