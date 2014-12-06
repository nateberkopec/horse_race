require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  test 'setting up a new race' do
    @race = Race.new(horses: 4.times.map{|i| Horse.new(name: "Horse #{i}")})
    @race.length = 100

    assert @race.save
    assert_equal 4, @race.horses.size
    assert @race.code
  end
end
