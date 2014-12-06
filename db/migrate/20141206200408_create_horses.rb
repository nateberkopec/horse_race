class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.integer :position
      t.integer :race_id

      t.timestamps null: false
    end

    add_index :horses, :race_id
  end
end
