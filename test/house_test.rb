require 'minitest/autorun'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def test_a_house_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_house_has_a_price_and_address
    house = House.new("$400000", "123 sugar lane")
    assert_equal 400000, house.price
    assert_equal "123 sugar lane", house.address
  end

  def test_a_house_can_contain_rooms
    house = House.new("$400000", "123 sugar lane")
    room1 = Room.new(:bedroom, 10, "13")
    room2 = Room.new(:bedroom, 14, "17")
    assert_equal [], house.rooms

    house.add_room(room1)
    assert_equal :bedroom, house.rooms[0].category

    house.add_room(room2)
    assert_equal 238, house.rooms[1].area

    assert_equal 2, house.rooms.size
  end

  def test_a_house_knows_if_its_above_market_avg
    house1 = House.new("$400000", "123 sugar lane")
    assert_equal false, house1.above_market_average?

    house2 = House.new("$500001", "123 sugar lane")
    assert_equal true, house2.above_market_average?
  end

  def test_a_house_can_return_rooms_by_category
    house = House.new("$400000", "123 sugar lane")
    room1 = Room.new(:bedroom, 10, "13")
    house.add_room(room1)
    room2 = Room.new(:bedroom, 14, "17")
    house.add_room(room2)
    room3 = Room.new(:bathroom, 8, "8")
    house.add_room(room3)
    room4 = Room.new(:bathroom, 12, "10")
    house.add_room(room4)
    room5 = Room.new(:bathroom, 9, "11")
    house.add_room(room5)
    room6 = Room.new(:living_room, 12, "15")
    house.add_room(room6)

    house.rooms_from_category(:bedroom).each do |room|
      assert_equal :bedroom, room.category
    end
    assert_equal 2, house.rooms_from_category(:bedroom).size

    house.rooms_from_category(:bathroom).each do |room|
      assert_equal :bathroom, room.category
    end
    assert_equal 3, house.rooms_from_category(:bathroom).size
  end



end
