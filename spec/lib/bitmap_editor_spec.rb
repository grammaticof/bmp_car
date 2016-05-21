require 'spec_helper'

describe BitmapEditor do
  subject { BitmapEditor.new }

  context 'STDIN sequence I 5 6, L 2 3' do
    it 'should return the expected value' do
      allow(subject).to receive(:gets).and_return("I 5 6", "L 2 3 C", "S", "X")
      allow(subject).to receive(:loop).and_yield

      expect { subject.run }
      .to output(/OOOOO\nOOOOO\nOCOOO\nOOOOO\nOOOOO\nOOOOO/)
      .to_stdout
    end
  end

  context 'STDIN sequence I 5 6, L 2 3, V 2 3 6 W, H 3 5 2 Z' do
    it 'should return the expected value' do
      allow(subject).to receive(:gets).and_return("I 5 6", "L 2 3 C", "V 2 3 6 W", "H 3 5 2 Z", "S", "X")
      allow(subject).to receive(:loop).and_yield

      expect { subject.run }
      .to output(/OOOOO\nOOZZZ\nOWOOO\nOWOOO\nOWOOO\nOWOOO/)
      .to_stdout
    end
  end
end
