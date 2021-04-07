class League
  attr_reader :name, :teams

  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

  def captains
    @teams.map do |team|
      team.players.max_by {|player| player.salary} #refactor this? .captain method on team only returns name
    end
  end

  def players_by_team
    players_by_team = {}
    @teams.each do |team|
      players_by_team[team] = team.players.map{ |player| player.name }
    end
    players_by_team
  end

  def all_players
    all_players = @teams.flat_map do |team|
      team.players
    end
  end

  def most_expensive_player
    highest_paid_player = self.all_players.max_by do |player|
      player.salary
    end

    highest_paid_players = self.all_players.find_all do |player|
      player.salary == highest_paid_player.salary
    end

    highest_paid_players.map do |player|
      player.name
    end
  end

  def players_by_salary_range
    groups = self.all_players.group_by do |player|
      player.salary / 1_000_000
    end

    groups.map do |range, players|
      ["Over #{range}M", players.map {|player| player.name}]
    end.to_h
  end
end
