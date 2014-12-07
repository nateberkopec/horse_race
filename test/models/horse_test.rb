require 'test_helper'

class HorseTest < ActiveSupport::TestCase

  test 'can be added to a race via race_code' do
    @horse = Horse.new(name: 'Seabiscuit', race_code: 'XKRF')
    assert_equal 'XKRF', @horse.race.code
  end

  test 'horse position cannot be updated by more than 1' do
    @horse = horses(:regular_horse)
    @horse.position += 1
    assert @horse.valid?
    @horse.position += 1
    refute @horse.valid?
  end

end
