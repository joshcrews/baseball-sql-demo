class CreatePlayersSeasons < ActiveRecord::Migration
  def change
    create_table :players_seasons do |t|
      t.belongs_to :team_season, index: true
      t.belongs_to :player, index: true
      t.integer :jersey_number
    end
  end
end
