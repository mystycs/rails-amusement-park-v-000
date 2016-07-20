class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :password_digest
      t.integer :nausea, :default => 0
      t.integer :happiness, :default => 0
      t.integer :tickets, :default => 0
      t.integer :height, :default => 0
      t.boolean :admin, :default => false

      t.timestamps null: false
    end
  end
end
