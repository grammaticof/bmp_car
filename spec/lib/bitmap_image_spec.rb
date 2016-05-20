require 'spec_helper'

describe BitmapImage do

  context '#initialize (3, 4)' do
    let(:result) do
      [["O","O","O"],
       ["O","O","O"],
       ["O","O","O"],
       ["O","O","O"]]
    end

    it 'create an array di 3x4 "O" values' do
      expect(BitmapImage.new(width: 3, height: 4).image).to match_array(result)
    end
  end

end
