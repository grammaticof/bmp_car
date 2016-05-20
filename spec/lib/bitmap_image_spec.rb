require 'spec_helper'

describe BitmapImage do
  let(:blank_image) do
    [%w(O O O),
     %w(O O O),
     %w(O O O),
     %w(O O O)]
  end

  context '#new(width: 3, height: 4)' do
    it 'create an array of 3x4 "O" values' do
      expect(BitmapImage.new(width: 3, height: 4).image).to match_array(blank_image)
    end
  end

  context '#colour_at(x: 2, y: 3, c: "C")' do
    let(:bitmap) { BitmapImage.new(width: 3, height: 4) }
    let(:result) do
      [%w(O O O),
       %w(O O O),
       %w(O C O),
       %w(O O O)]
    end

    it 'modifies the array in position 2,3 with value "C"' do
      bitmap.colour_at(x: 2, y: 3, c: 'C')
      expect(bitmap.image).to match_array(result)
    end
  end

  context '#v_segment(x: 2, y1: 2, y2: 4, c: "C")' do
    let(:bitmap) { BitmapImage.new(width: 3, height: 4) }
    let(:result) do
      [%w(O O O),
       %w(O C O),
       %w(O C O),
       %w(O C O)]
    end

    it 'modifies the array in position 2,3 with value "C"' do
      bitmap.v_segment(x: 2, y1: 2, y2: 4, c: 'C')
      expect(bitmap.image).to match_array(result)
    end
  end

  context '#h_segment(x1: 1, x2: 2, y: 4, c: "C")' do
    let(:bitmap) { BitmapImage.new(width: 3, height: 4) }
    let(:result) do
      [%w(O O O),
       %w(O O O),
       %w(O O O),
       %w(C C O)]
    end

    it 'modifies the array in position 2,3 with value "C"' do
      bitmap.h_segment(x1: 1, x2: 2, y: 4, c: 'C')
      expect(bitmap.image).to match_array(result)
    end
  end
end
