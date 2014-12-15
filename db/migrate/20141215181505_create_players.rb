class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :last_name
      t.string :first_name
      t.string :country
      t.integer :points
      t.integer :week_change
      t.integer :tournaments_played
      t.integer :ranking_id

      t.timestamps
    end
  end
end
