class Race < ActiveRecord::Base
  before_save :create_code
  has_many :horses

  private

  def create_code
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    self.code = (0...4).map{ charset.to_a[rand(charset.size)] }.join
  end
end
