class AddDefaultToRaceLength < ActiveRecord::Migration
  def up
    change_column :races, :length, :integer, default: 100
  end

  def down
    change_column :races, :length, :integer, default: nil
  end
end
