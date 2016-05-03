require_relative 'spec_helper'

# Units that can fight, such as the Footman, have both health points to indicate their health and attack power to indicate how much damage they deal to other units
# As such, they must start off with a certain amount of each



describe Barracks do 
  describe "#damage" do
    before :each do
      @barracks = Barracks.new
      @footman = Footman.new
    end
    
    it "can be damaged by footmen" do 
      @footman.attack!(@barracks)
      expect(@barracks.health_points).to be < 500
    end

    it "takes half damage from attacks" do
      @footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495)
    end

    it "takes the ceiling value from an attack" do
      expect(@footman).to receive(:attack_power).and_return(7)
      @footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(496)
    end
  end
end

describe Footman do
  describe "#attack" do

    it "can attack the barracks" do
      footman = Footman.new
      barracks = Barracks.new
      footman.attack!(barracks)
      expect(barracks.health_points).to be < 500
    end

  end
end