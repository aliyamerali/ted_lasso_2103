require 'rspec'
require './lib/player'
require './lib/team'
require './lib/league'

describe League do
  describe '#initialize' do
    premier = League.new("Premier League")

    it 'exists' do
      expect(premier).to be_instance_of(League)
    end

    it 'has attributes name and teams, which starts as an empty array' do
      expect(premier.name).to eq("Premier League")
      expect(premier.teams).to eq([])
    end
  end

  describe '#add_team' do
    premier = League.new("Premier League")

    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    it 'adds teams to the teams array' do
      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.teams).to eq([richmond, manchester])
    end
  end

  describe '#captains' do
    premier = League.new("Premier League")

    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier.add_team(richmond)
    premier.add_team(manchester)

    it 'returns an array of player objects containing team captains' do
      expect(premier.captains).to eq([roy, fernandinho])
    end
  end

  describe '#players_by_team' do
    premier = League.new("Premier League")

    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier.add_team(richmond)
    premier.add_team(manchester)

    it 'returns a hash with Team objects as keys, array of player names as values' do
      expect(premier.players_by_team).to eq({richmond => [roy.name, sam.name], manchester => [jamie.name, fernandinho.name]})
    end
  end

  describe '#most_expensive_player' do
    premier = League.new("Premier League")

    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier.add_team(richmond)
    premier.add_team(manchester)

    it 'returns an array containing the name of the player with the highest salary across all teams in league' do
      expect(premier.most_expensive_player).to eq(["Fernandinho"])
    end

    it 'returns array with multiple names if highest salary is tied' do
      aliya = Player.new({name: "Aliya Merali", position: "Striker", salary: 5_200_000})
      denver = Team.new("Denver", "Michael Hancock", [aliya])
      premier.add_team(denver)

      expect(premier.most_expensive_player).to eq(["Fernandinho", "Aliya Merali"])
    end
  end
end
