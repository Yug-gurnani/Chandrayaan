# frozen_string_literal: true

require_relative '../chandrayaan'

describe Chandrayaan do
  describe '#navigate' do
    it 'Move spacecraft forward' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(['f'])).to eq([[0, 1, 0], 'N'])
    end

    it 'Move spacecraft backward' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(['b'])).to eq([[0, -1, 0], 'N'])
    end

    it 'Move spacecraft forward and backward both' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[f b])).to eq([[0, 0, 0], 'N'])
    end

    it 'Move spacecraft forward and backward both multiple times' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[f b f b f b b f b])).to eq([[0, -1, 0], 'N'])
    end

    it 'Change Directions of spacecraft 90 degrees to the left' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[l])).to eq([[0, 0, 0], 'W'])
    end

    it 'Change Directions of spacecraft 90 degrees to the right' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[r])).to eq([[0, 0, 0], 'E'])
    end

    it 'Change Directions of spacecraft multiple times to the left and right' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[r l r l l l l r])).to eq([[0, 0, 0], 'S'])
    end

    it 'Change Directions of spacecraft and move forward' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[r f])).to eq([[1, 0, 0], 'E'])
    end

    it 'Change Directions of spacecraft and move backward' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[r b])).to eq([[-1, 0, 0], 'E'])
    end

    it 'Change Directions of spacecraft and move back and forth' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[r r r l r l f l b f l r])).to eq([[0, 1, 0], 'E'])
    end

    it 'Change Directions of spacecraft and move back and forth' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[r f l r])).to eq([[1, 0, 0], 'E'])
    end

    it 'Change Directions of spacecraft to upwards' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[u])).to eq([[0, 0, 0], 'U'])
    end

    it 'Change Directions of spacecraft to downwards' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[d])).to eq([[0, 0, 0], 'D'])
    end

    it 'Change angle of spacecraft and move it ' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[d f])).to eq([[0, 0, 1], 'D'])
    end

    it 'Change angle of spacecraft and move it multiple times ' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[d f f b u b])).to eq([[0, 0, 0], 'U'])
    end
  end
end
