require 'pry'
class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_players = []
    @teams.each do |team|
      unless team.eliminated?
        active_players << team.players_by_position(position)
      end
    end
    active_players.flatten
  end

  def all_players_by_position
    all_players = Hash.new
    @teams.each do |team|
      team.players.each do |player|
        all_players[player.position] = all_players[player.position]
      end
    end
    all_players.each_key {|key| all_players[key] = active_players_by_position(key)}
  end

end
