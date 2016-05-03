require_relative 'spec_helper'

  describe SiegeEngine do

    it 'has 400 HP and 50 AP' do
      siege = SiegeEngine.new
      expect(siege.health_points).to eq(400)
      expect(siege.attack_power).to eq(50)
    end

    describe '#attack' do
      before :each do
        @siege = SiegeEngine.new
      end

      it 'cannot attack footmen' do
        footman = Footman.new
        expect(@siege.attack!(footman)).to be false
      end

      it 'can attack buildings' do
        barracks = Barracks.new
        @siege.attack!(barracks)
        expect(barracks.health_points).to eq(400)
      end

      it 'can attack other siege engines' do
        target = SiegeEngine.new
        @siege.attack!(target)
        expect(target.health_points).to eq(350)
      end

      it 'cannot attack peasants' do
        peasant = Peasant.new
        expect(@siege.attack!(peasant)).to be false
      end

      it 'can be attacked by other siege engines' do
        enemy = SiegeEngine.new
        enemy.attack!(@siege)
        expect(@siege.health_points).to eq(350)
      end


  end

  describe Barracks do 
    before :each do
      @barracks = Barracks.new
    end

    it 'takes double damage from siege engines' do
    siege = SiegeEngine.new
    siege.attack!(@barracks)
    expect(@barracks.health_points).to eq(400)
    end

    it 'costs 200 gold, 60 lumber, and 3 food' do
      @barracks.train_siege_engine
      expect(@barracks.gold).to eq(800)
      expect(@barracks.lumber).to eq(440)
      expect(@barracks.food).to eq(77)
    end

    it 'cannot train siege engine with insufficient gold' do
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_train_siege?).to be_falsey
    end

    it 'cannot train siege engine with insufficient food' do
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_train_siege?).to be_falsey
    end

    it 'cannot train siege engine with insufficient lumber' do
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_train_siege?).to be_falsey
    end
  end
  
end