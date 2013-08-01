class TeamSeason < ActiveRecord::Base
  belongs_to :team
  has_many :players_seasons
  has_many :players, :through => :players_seasons
end
