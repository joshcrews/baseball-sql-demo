class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.date :birthdate
    end
  end
end
