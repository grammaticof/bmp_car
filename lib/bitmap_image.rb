class BitmapImage
  attr_reader :image
  WHITE = 'O'

  def initialize(width:, height:)
    @image = blank(width.to_i, height.to_i)
  end

  def reset
    width = @image.first.length
    height = @image.length
    @image = blank(width, height)
  end

  def colour_at(x:, y:, c:)
    array_x = x - 1
    array_y = y - 1

    @image[array_y][array_x] = c
  end

  def show
    @image.each { |pixel| puts pixel.join('') }
  end

  private

  def blank(width, height)
    Array.new(height) { Array.new(width, WHITE) }
  end
end
