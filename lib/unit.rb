class Unit

  attr_reader :health_points, :attack_power

  def initialize(health, attack)
    @health_points, @attack_power = health, attack
  end 

  def attack!(target, multiplier=1)
    if target.dead? || self.dead? 
      false
    else
      target.damage(attack_power*multiplier)
    end
  end

  def damage(attack)
    @health_points -= attack
  end

  def dead?
    health_points <= 0
  end

end
