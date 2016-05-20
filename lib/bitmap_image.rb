class BitmapImage
  attr_reader :image
  WHITE = 'O'

  def initialize(width:, height:)
    @image = blank(width, height)
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

  def v_segment(x:, y1:, y2:, c:)
    y1.upto(y2) do |y|
      colour_at(x: x, y: y, c: c)
    end
  end

  def h_segment(x1:, x2:, y:, c:)
    x1.upto(x2) do |x|
      colour_at(x: x, y: y, c: c)
    end
  end

  def show
    @image.each { |pixel| puts pixel.join('') }
  end

  private

  def blank(width, height)
    Array.new(height) { Array.new(width, WHITE) }
  end
end
