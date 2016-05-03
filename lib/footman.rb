# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'

class Footman < Unit

attr_accessor :health_points, :attack_power

  def initialize(health=60, attack=10)
    super
  end

  def attack!(target)
    target.is_a?(Building) ? super(target,0.5) : super
  end

end

