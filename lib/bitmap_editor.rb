require_relative 'bitmap_image'

class BitmapEditor
  def run
    puts 'type ? for help'

    loop do
      print '> '
      input = gets.split(' ')

      begin
        case input.first
        when 'X'
          break
        when 'I'
          @image = BitmapImage.new(width: input[1], height: input[2])
        when 'L'
          @image ? @image.colour_at(x: input[1], y: input[2], c: input[3]) : show_help
        when 'V'
          @image ? @image.v_segment(x: input[1], y1: input[2], y2: input[3], c: input[4]) : show_help
        when 'H'
          @image ? @image.h_segment(x1: input[1], x2: input[2], y: input[3], c: input[4]) : show_help
        when 'S'
          @image ? @image.show : show_help
        when 'C'
          @image ? @image.reset : show_help
        when '?'
          show_help
        else
          puts 'Unrecognised command :('
        end
      rescue BitmapError::Base => e
        puts e.message
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
