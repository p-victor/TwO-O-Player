class Player

  attr_reader :max_hp, :id
  attr_accessor :hp

  def initialize(index)
    @id=index
    @max_hp=3
    @hp=max_hp
  end

  def get_score
    "#{@hp}/#{@max_hp}"
  end 

  def dead?
    @hp <= 0
  end
    
end