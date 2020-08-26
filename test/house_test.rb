require 'minitest/autorun'
require './lib/room'
require './lib/house

class HouseTest < Minitest::Test

  def test_a_house_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end
end
