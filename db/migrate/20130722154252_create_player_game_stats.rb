class CreatePlayerGameStats < ActiveRecord::Migration
  def change
    create_table :player_game_stats do |t|
      t.belongs_to :game, index: true
      t.belongs_to :player, index: true
      t.string :name, null: false
      t.integer :value, null: false
    end
  end
end
