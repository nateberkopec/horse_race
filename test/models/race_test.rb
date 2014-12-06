require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  test 'setting up a new race' do
    @race = Race.new(horses: 4.times.map{|i| Horse.new(name: "Horse #{i}")})
    @race.length = 100

    assert @race.save
    assert_equal 4, @race.horses.size
    assert @race.code
  end

  test 'running a race' do
    @race = Race.new(horses: 4.times.map{|i| Horse.new(name: "Horse #{i}", position: 0)})
    @race.length = 100

    our_horse = @race.horses.first
    100.times { our_horse.position += 1 }

    assert @race.finished?
    assert_equal our_horse, @race.winner
  end
end
