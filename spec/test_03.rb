require_relative 'spec_helper'

# Now that our Barracks and Footman classes are initializable, lets allow the player to train a footman from their barracks
# This of course costs the player some resources

describe Unit do
  describe '#attack' do
    before :each do
      @arthas = Footman.new
      @arthas.damage(60)
      @uther = Footman.new
    end

    it "dead people should not be able to attack" do
      expect(@arthas.attack!(@uther)).to be false
    end

    it "people should not be able to attack dead people" do
      expect(@uther.attack!(@arthas)).to be false
    end
  end  
end

