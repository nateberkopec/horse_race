class Horse < ActiveRecord::Base
  belongs_to :race
  attr_accessor :race_code

  validates :name, presence: true

  def race_code=(code)
    self.race = Race.find_or_initialize_by code: code
  end
end
