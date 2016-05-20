require_relative 'bitmap_image'

class BitmapEditor
  def run
    puts 'type ? for help'

    loop do
      print '> '
      input = gets.split(' ')

      case input.first
      when 'X'
        break
      when 'I'
        @image = BitmapImage.new(
          width: input[1].to_i,
          height: input[2].to_i
        )
      when 'V'
        @image.v_segment(
          x: input[1].to_i,
          y1: input[2].to_i,
          y2: input[3].to_i,
          c: input[4]
        )
      when 'S'
        @image.show
      when 'C'
        @image.reset
      when '?'
        show_help
      else
        puts 'unrecognised command :('
      end
    end

    puts 'goodbye!'
  end

  private

  def show_help
    puts "? - Help
    I M N - Create a new M x N image with all pixels coloured white (O).
    C - Clears the table, setting all pixels to white (O).
    L X Y C - Colours the pixel (X,Y) with colour C.
    V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
    H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
    S - Show the contents of the current image
    X - Terminate the session"
  end
end
