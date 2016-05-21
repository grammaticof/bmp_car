require_relative 'bitmap_error'

class BitmapImage
  include BitmapError

  attr_reader :image
  WHITE = 'O'.freeze

  def initialize(width:, height:)
    @image = blank(width, height)
  end

  def reset
    width = @image.first.length
    height = @image.length
    @image = blank(width, height)
  end

  def colour_at(x:, y:, c:)
    x, y = valid_coordinates(x, y)
    valid_colour?(c)

    array_x = x - 1
    array_y = y - 1

    raise BitmapError::Base, 'Out of bounds values' if @image.dig(array_y, array_x).nil?
    @image[array_y][array_x] = c
  end

  def v_segment(x:, y1:, y2:, c:)
    x, y1, y2 = valid_coordinates(x, y1, y2)

    y1.upto(y2) do |y|
      colour_at(x: x, y: y, c: c)
    end
  end

  def h_segment(x1:, x2:, y:, c:)
    x1, x2, y = valid_coordinates(x1, x2, y)

    x1.upto(x2) do |x|
      colour_at(x: x, y: y, c: c)
    end
  end

  def show
    @image.each { |pixel| puts pixel.join('') }
  end

  private

  def blank(width, height)
    width, height = valid_coordinates(width, height)
    check_range(width, height)
    Array.new(height) { Array.new(width, WHITE) }
  end

  def valid_coordinates(*values)
    values.map { |v| Integer(v) }
  rescue ArgumentError, TypeError
    raise BitmapError::Base, 'Not Integer values'
  end

  def check_range(*values)
    raise BitmapError::Base, 'Out of range' unless values.all? { |v| v.between?(0, 251) }
  end

  def valid_colour?(value)
    raise BitmapError::Base, 'Not a valid colour' unless /[[:upper:]]/.match(value)
  end
end
