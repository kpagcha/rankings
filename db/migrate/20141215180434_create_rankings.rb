class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.string :name
      t.integer :sport
      t.integer :year

      t.timestamps
    end
  end
end
