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

    it 'raises an error if out of bounds 1..250' do
      expect { BitmapImage.new(width: 0, height: 100) }.to raise_error(BitmapError::Base)
      expect { BitmapImage.new(width: 1, height: 251) }.to raise_error(BitmapError::Base)
      expect { BitmapImage.new(width: 0, height: 251) }.to raise_error(BitmapError::Base)
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

    it 'raises an error if out of the image bounds' do
      expect { bitmap.colour_at(x: 10, y: 10, c: 'C') }.to raise_error(BitmapError::Base)
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

    it 'raises an error if out of bounds' do
      expect { bitmap.v_segment(x: 10, y1: 10, y2: 10, c: 'C') }.to raise_error(BitmapError::Base)
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

    it 'raises an error if out of bounds' do
      expect { bitmap.h_segment(x1: 10, x2: 10, y: 10, c: 'C') }.to raise_error(BitmapError::Base)
    end

    it 'raises an error if color not recognised' do
      expect { bitmap.h_segment(x1: 1, x2: 2, y: 4, c: 'c') }.to raise_error(BitmapError::Base)
      expect { bitmap.h_segment(x1: 1, x2: 2, y: 4, c: 'CC') }.to raise_error(BitmapError::Base)
      expect { bitmap.h_segment(x1: 1, x2: 2, y: 4, c: '1') }.to raise_error(BitmapError::Base)
    end
  end
end
