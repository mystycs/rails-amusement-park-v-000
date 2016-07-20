class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|

      t.references :user
      t.references :attraction

      t.timestamps null: false
    end
  end
end
