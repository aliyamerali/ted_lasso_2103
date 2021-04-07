require 'rspec'
require './lib/player'
require './lib/team'

describe Team do
  describe '#initialize' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    team = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    it 'exists' do
      expect(team).to be_instance_of(Team)
    end

    it 'has attributes name, coach, and players' do
      expect(team.name).to eq("AFC Richmond")
      expect(team.coach).to eq("Ted Lasso")
      expect(team.players).to eq([roy, sam])
    end
  end

  describe '#total_salary' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    team = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    it 'returns total salary of all players' do
      expect(team.total_salary).to eq(1600000)
    end
  end

  describe '#captain' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    team = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    it 'returns the player with the highest salary' do
      expect(team.captain).to eq(roy.name)
    end
  end

  describe '#positions_filled' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    team = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    it 'returns the positions for which there are players' do
      expect(team.positions_filled).to eq([roy.position, sam.position])
    end
  end
end
