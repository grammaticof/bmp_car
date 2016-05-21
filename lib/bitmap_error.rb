module BitmapError
  class Base < StandardError
    def initialize(msg = nil)
      @message = msg
    end

    def message
      "Error: #{@message}. Please use ? for help"
    end
  end
end
