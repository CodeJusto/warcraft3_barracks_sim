require_relative 'unit'
class Peasant < Unit

attr_accessor :health_points, :attack_power

  def initialize(health=35,attack=0)
    @health_points = health
    @attack_power = attack
  end

end