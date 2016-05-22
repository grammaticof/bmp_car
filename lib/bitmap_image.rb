require_relative 'bitmap_error'

class BitmapImage
  include BitmapError

  attr_reader :image
  WHITE = 'O'.freeze
  MINMAX = 1..250

  def initialize(width:, height:, c: WHITE)
    @image = blank(width, height, c)
  end

  def reset(c: WHITE)
    width = @image.first.length
    height = @image.length
    @image = blank(width, height, c)
  end

  def colour_at(x:, y:, c:)
    x, y = validate_coordinates(x, y)
    valid_colour?(c)

    array_x = x - 1
    array_y = y - 1

    raise BitmapError::Base, 'Out of bounds values' if @image.dig(array_y, array_x).nil?

    c = c.colorize(:red).on_white
    @image[array_y][array_x] = c
  end

  def v_segment(x:, y1:, y2:, c:)
    x, y1, y2 = validate_coordinates(x, y1, y2)

    y1.upto(y2) do |y|
      colour_at(x: x, y: y, c: c)
    end
  end

  def h_segment(x1:, x2:, y:, c:)
    x1, x2, y = validate_coordinates(x1, x2, y)

    x1.upto(x2) do |x|
      colour_at(x: x, y: y, c: c)
    end
  end

  def show
    @image.each { |pixel| puts pixel.join('') }
  end

  private

  def blank(width, height, c)
    width, height = validate_coordinates(width, height)
    valid_range?(width, height)
    valid_colour?(c)

    c = c.colorize(:black).on_white

    Array.new(height) { Array.new(width, c) }
  end

  def validate_coordinates(*values)
    values.map { |v| Integer(v) }
  rescue ArgumentError, TypeError
    raise BitmapError::Base, 'Wrong parameters'
  end

  def valid_range?(*values)
    raise BitmapError::Base, 'Out of range' unless values.all? { |v| MINMAX.cover?(v) }
  end

  def valid_colour?(value)
    raise BitmapError::Base, 'Not a valid colour' unless /^[A-Z]{1}$/ =~ value
  end
end
