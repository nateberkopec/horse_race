class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :code
      t.integer :length

      t.timestamps null: false
    end
  end
end
