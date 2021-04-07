class Team
  attr_reader :name, :coach, :players

  def initialize(name, coach, players)
    @name = name
    @coach = coach
    @players = players
  end

  def total_salary
    players.sum do |player|
      player.salary
    end
  end

  def captain
    players.max_by {|player| player.salary}.name
  end

  def positions_filled
    players.map do |player|
      player.position
    end
  end

end
