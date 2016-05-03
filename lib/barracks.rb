class Barracks

attr_accessor :gold, :food

# @@gold = 1000
# @@food = 60
# @@f_gold_cost = 135
# @@f_food_cost = 2

  def initialize(gold=1000, food=80)
    @gold = gold
    @food = food
  end

  def can_train_footman?
    (gold < 135 || food < 2) ? false : true
  end

  def train_footman
    if can_train_footman? 
      puts "Footman created!"
      self.gold -= 135
      self.food -= 2
      Footman.new
    else
      nil
      # puts "Need more food! You require #{@@f_food_cost - @food} more food.
    end
  end

  def can_train_peasant?
    gold < 90 || food < 5 ? false : true
  end

  def train_peasant
    if can_train_peasant?
      puts "Peasant created!"
      self.gold -= 90
      self.food -= 5
      Peasant.new
    end
  end
end
