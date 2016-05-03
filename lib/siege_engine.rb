class SiegeEngine < Unit

  def initialize(health=400, attack=50)
    super
  end

  def attack!(target)
    if target.class == SiegeEngine
      super
    elsif target.is_a?(Building)
      super(target,2)
    else
      false
    end
  end

end
