class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.integer :position

      t.references :race
      t.timestamps null: false
    end
  end
end
