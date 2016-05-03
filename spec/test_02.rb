require_relative 'spec_helper'

# Resources allow you to create units. In our case (for simplicity), these resources will be stored directly within the barracks

describe Unit do
  describe '#dead?' do
    before :each do
      @footman = Footman.new
    end

    it 'should die when killed' do
      @footman.damage(61)
      expect(@footman.dead?).to be true
    end

    it 'should not die when only wounded' do
      @footman.damage(59)
      expect(@footman.dead?).to be false
    end

    it 'should REALLY die when exploded' do
      @footman.damage(50000)
      expect(@footman.dead?).to be true
    end
  end
end
