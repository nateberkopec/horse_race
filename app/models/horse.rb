class Horse < ActiveRecord::Base
  belongs_to :race
  attr_accessor :race_code

  def race_code=(code)
    self.race = Race.find_by code: code
  end
end
