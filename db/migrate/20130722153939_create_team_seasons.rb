class CreateTeamSeasons < ActiveRecord::Migration
  def change
    create_table :team_seasons do |t|
      t.string :year, null: false
      t.belongs_to :team, index: true
    end
  end
end
