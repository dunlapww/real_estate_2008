class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.gsub("$","").to_i
    @address = address
    @rooms =[]
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def details
    ["price","address"].zip([@price, @address]).to_h
  end

  def price_per_square_foot
    if @rooms == []
      return "You need to add some rooms to calculate price per square foot!"
    else
      (@price.to_f / @rooms.reduce(0) {|sum,room| sum += room.area}).round(2)
    end
  end

  def rooms_sorted_by_area
    @rooms.sort_by {|room| room.area}
  end

  def rooms_by_category
    @rooms.group_by {|room| room.category}
  end

end
