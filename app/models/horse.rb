class Horse < ActiveRecord::Base
  belongs_to :race
  attr_accessor :race_code

  NAMES = YAML.load_file('lib/horse_names.yml')

  validates :name, presence: true
  validate :no_shortcuts, if: proc { |h| h.position_changed? }

  before_save :creates_race_if_none_exists

  def race_code=(code)
    self.race = Race.find_or_initialize_by code: code
  end

  private

  def no_shortcuts
    unless (-1..1) === (position - position_was)
      errors.add(:position, 'cannot be increased by more than 1')
    end
  end

  def creates_race_if_none_exists
    self.race ||= Race.create
  end

  def assigns_name_if_none_exists
    self.name ||= NAMES.sample
  end
end
