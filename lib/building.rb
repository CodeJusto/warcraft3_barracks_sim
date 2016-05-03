class Building

  attr_reader :health_points

  def initialize(health)
    @health_points = health
  end

  def damage(attack)
    @health_points -= (attack).ceil
  end

  def dead?
    health_points <= 0
  end
end