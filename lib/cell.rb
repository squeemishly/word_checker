class Cell
  attr_accessor :value
  attr_reader :row,
              :column

  def initialize(row, column)
    @row = row
    @column = column
    @value = " "
  end

  def add_value(letter)
    if letter.length > 1
      raise("Only one letter per cell please!")
    end

    @value = letter
  end
end
