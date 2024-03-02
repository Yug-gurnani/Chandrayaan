# frozen_string_literal: true

require_relative '../chandrayaan'

describe Chandrayaan do
  describe '#navigate' do
    it 'Move spacecraft forward' do
      spacecraft = Chandrayaan.new
      expect(spacecraft.navigate(['f'])).to eq([0, 1, 0])
    end
  end
end
