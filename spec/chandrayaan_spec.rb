# frozen_string_literal: true

require_relative '../chandrayaan'

describe Chandrayaan do
  describe '#navigate' do
    it 'Move spacecraft forward' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(['f'])).to eq([0, 1, 0])
    end

    it 'Move spacecraft backward' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(['b'])).to eq([0, -1, 0])
    end

    it 'Move spacecraft forward and backward both' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[f b])).to eq([0, 0, 0])
    end

    it 'Move spacecraft forward and backward both multiple times' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(%w[f b f b f b b f b])).to eq([0, -1, 0])
    end
  end
end
