class Cell
  def self.regenerate(state, neighbours)
    if state
      state = count_live_neighbours(neighbours).between?(2,3) ? 1 : 0
    else
      state = count_live_neighbours(neighbours) == 3 ? 1 : 0
    end
    stage
  end

  private
  def self.count_live_neighbours(neighbours)
    neighbours.reduce(0, :+)
  end
end