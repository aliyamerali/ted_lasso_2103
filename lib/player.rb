class Player
  attr_reader :name, :position, :salary

  def initialize(info_hash)
    @name = info_hash[:name]
    @position = info_hash[:position]
    @salary = info_hash[:salary]
  end
end
