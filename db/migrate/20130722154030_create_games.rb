class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :host_team, index: true
      t.belongs_to :guest_team, index: true
      t.date :played_on, null: false
      t.integer :host_team_score, null: false
      t.integer :guest_team_score, null: false
    end
  end
end
