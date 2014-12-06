require 'test_helper'

class RaceTest < ActiveSupport::TestCase

  def setup
    @race = Race.new(
      horses: 4.times.map{|i| Horse.new(name: "Horse #{i}", position: 0)},
      length: 100
    )
  end

  test 'setting up a new race' do
    assert @race.save
    assert @race.code
  end

  test 'running a race' do
    our_horse = @race.horses.first
    100.times { our_horse.position += 1 }

    assert @race.finished?
    assert_equal our_horse, @race.winner
  end

end
