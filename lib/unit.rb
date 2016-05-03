class Unit

attr_reader :health_points, :attack_power

  def initialize(health,attack)
    @health_points = health
    @attack_power = attack
  end 

  def attack!(target)
    target.damage(attack_power)
  end

  def damage(attack)
    @health_points -= attack
  end
end
