class Race < ActiveRecord::Base
  after_initialize :set_code
  has_many :horses

  VALID_CODE_CHARSET = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}

  validates :code, presence: true, uniqueness: true
  validates :length, presence: true

  def finished?
    horses.any? {|h| h.position >= self.length}
  end

  def winner
    horses.max { |a, b| a.position <=> b.position }
  end

  private

  def set_code
    self.code ||= (0...4).map{ VALID_CODE_CHARSET[rand(VALID_CODE_CHARSET.size)] }.join
  end
end
