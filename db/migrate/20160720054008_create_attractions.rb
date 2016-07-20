class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|

      t.string :name
      t.integer :tickets, :default => 0
      t.integer :nausea_rating, :default => 0
      t.integer :happiness_rating, :default => 0
      t.integer :min_height, :default => 0

      t.timestamps null: false
    end
  end
end
