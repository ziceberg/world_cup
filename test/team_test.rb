require 'minitest/autorun'
require 'minitest/pride'
require './lib/team'
require './lib/player'

class TeamTest < Minitest::Test
  def test_it_exists
    team = Team.new("France")

    assert_instance_of Team, team
  end

  def test_readable_attributes
    team = Team.new("France")

    assert_equal "France", team.country
    refute team.eliminated?
    assert_equal [], team.players
  end

  # def test_eliminated_can_be_changed
  #   team = Team.new("France")
  #
  #   team.eliminated = true
  #
  #   assert team.eliminated?
  # end

  def test_add_player
    team = Team.new("France")

    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

    team.add_player(mbappe)
    team.add_player(pogba)
    assert_equal [mbappe, pogba], team.players
  end

  def test_players_by_position
    team = Team.new("France")

    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

    team.add_player(mbappe)
    team.add_player(pogba)

    assert_equal [pogba], team.players_by_position("midfielder")
    assert_equal [], team.players_by_position("defender")
  end
end
