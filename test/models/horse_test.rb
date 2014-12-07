require 'test_helper'

class HorseTest < ActiveSupport::TestCase

  test 'can be added to a race via race_code' do
    horse = Horse.new(name: 'Seabiscuit', race_code: 'XKRF')

    assert_equal 'XKRF', horse.race.code
  end

end
