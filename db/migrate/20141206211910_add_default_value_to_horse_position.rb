class AddDefaultValueToHorsePosition < ActiveRecord::Migration
  def up
    change_column :horses, :position, :integer, default: 0
  end

  def down
    change_column :horses, :position, :integer, default: nil
  end
end
