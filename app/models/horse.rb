class Horse < ActiveRecord::Base
  belongs_to :race
  attr_accessor :race_code

  validates :name, presence: true
  validate :no_shortcuts, if: proc { |h| h.position_changed? }

  def race_code=(code)
    self.race = Race.find_or_initialize_by code: code
  end

  private

  def no_shortcuts
    unless (-1..1) === (position - position_was)
      errors.add(:position, 'cannot be increased by more than 1')
    end
  end
end
