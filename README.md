# World Cup

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!

## Iteration 1

Use TDD to create a `Player` class that responds to the following interaction pattern:

```ruby

pry(main)> require './lib/player'
#=> true

pry(main)> pogba = Player.new("Paul Pogba", :midfielder)
#=> #<Player:0x00007fbcc131d2d0...>

pry(main)> pogba.name
#=> "Paul Pogba"

pry(main)> pogba.position
#=> :midfielder
```

## Iteration 2

Use TDD to create a `Team` class that responds to the following interaction pattern:

```ruby

pry(main)> require './lib/team'
#=> true

pry(main)> require './lib/player'
#=> true

pry(main)> france = Team.new("France")
#=> #<Team:0x00007feab6adeca8...>

pry(main)> france.country
#=> "France"

pry(main)> france.players
#=> []

pry(main)> france.eliminated?
#=> false

pry(main)> france.eliminated = true

pry(main)> france.eliminated?
#=> true

pry(main)> mbappe = Player.new("Kylian Mbappe", :forward)
#=> #<Player:0x00007feab803f688...>

pry(main)> griezmann = Player.new("Antoine Griezmann", :forward)
#=> #<Player:0x00007feab7877a18...>

pry(main)> pogba = Player.new("Paul Pogba", :midfielder)
#=> #<Player:0x00007feab71546f0...>

pry(main)> france.add_player(mbappe)

pry(main)> france.add_player(griezmann)

pry(main)> france.add_player(pogba)

pry(main)> france.players
#=> [#<Player:0x00007feab803f688...>, #<Player:0x00007feab7877a18...>, #<Player:0x00007feab71546f0...>]

pry(main)> france.players_by_position(:midfielder)
#=> [#<Player:0x00007feab71546f0...>]

pry(main)> france.players_by_position(:forward)
#=> [#<Player:0x00007feab803f688...>, #<Player:0x00007feab7877a18...>]
```

## Iteration 3

Use TDD to create a `WorldCup` class that responds to the following interaction pattern. For the `active_players_by_position` method, an active player is a player that is on a team that is not eliminated.

```ruby
pry(main)> require './lib/world_cup'
#=> true

pry(main)> require './lib/team'
#=> true

pry(main)> require './lib/player'
#=> true

pry(main)> france = Team.new("France")
#=> #<Team:0x00007feab6adeca8...>

pry(main)> mbappe = Player.new("Kylian Mbappe", :forward)
#=> #<Player:0x00007feab803f688...>

pry(main)> griezmann = Player.new("Antoine Griezmann", :forward)
#=> #<Player:0x00007feab7877a18...>

pry(main)> pogba = Player.new("Paul Pogba", :midfielder)
#=> #<Player:0x00007feab71546f0...>

pry(main)> france.add_player(mbappe)

pry(main)> france.add_player(griezmann)

pry(main)> france.add_player(pogba)

pry(main)> croatia = Team.new("Croatia")
#=> #<Team:0x00007fce3c0b83c8...>

pry(main)> modric = Player.new("Luka Modric", :midfielder)
#=> #<Player:0x00007fce3b996450...>

pry(main)> perisic = Player.new("Ivan Perisic", :forward)
#=> #<Player:0x00007fce3d0891f8...>

pry(main)> vida = Player.new("Domagoj Vida", :defender)
#=> #<Player:0x00007fce3bb69b10...>

pry(main)> croatia.add_player(modric)

pry(main)> croatia.add_player(perisic)

pry(main)> croatia.add_player(vida)

pry(main)> world_cup = WorldCup.new(2018, [france, croatia])
#=> #<WorldCup:0x00007fce3b908858...>

pry(main)> world_cup.year
#=> 2018

pry(main)> world_cup.teams
#=> [#<Team:0x00007fce3c091f70...>, #<Team:0x00007fce3c0b83c8...>

pry(main)> world_cup.active_players_by_position(:forward)
#=> [#<Player:0x00007feab803f688...>, #<Player:0x00007feab7877a18...>, #<Player:0x00007fce3d0891f8...>]

pry(main)> croatia.eliminated = true

pry(main)> world_cup.active_players_by_position(:forward)
#=> [#<Player:0x00007feab803f688...>, #<Player:0x00007feab7877a18...>]
```

## Iteration 4

Use TDD to update your WorldCup class so that it responds to the following interaction pattern:

```ruby
pry(main)> require './lib/player'
# => true

pry(main)> require './lib/team'
# => true

pry(main)> require './lib/world_cup'
# => true

pry(main)> mbappe = Player.new("Kylian Mbappe", :forward)
# => #<Player:0x00007ff1160f9c40...>

pry(main)> griezmann = Player.new("Antoine Griezmann", :forward)
# => #<Player:0x00007ff11690db48...>

pry(main)> pogba = Player.new("Paul Pogba", :midfielder)
# => #<Player:0x00007ff1168cca08...>

pry(main)> france = Team.new("France")
# => #<Team:0x00007ff1158981a0...>

pry(main)> france.add_player(mbappe)    

pry(main)> france.add_player(griezmann)    

pry(main)> france.add_player(pogba)    

pry(main)> modric = Player.new("Luka Modric", :midfielder)
# => #<Player:0x00007ff116102688...>

pry(main)> perisic = Player.new("Ivan Perisic", :forward)    
# => #<Player:0x00007ff1160c2358...>

pry(main)> vida = Player.new("Domagoj Vida", :defender)    
# => #<Player:0x00007ff11590da68...>

pry(main)> croatia = Team.new("Croatia")
# => #<Team:0x00007ff1159db030...>

pry(main)> croatia.add_player(modric)    

pry(main)> croatia.add_player(perisic)    

pry(main)> croatia.add_player(vida)    

pry(main)> world_cup = WorldCup.new(2018, [france, croatia])    
# => #<WorldCup:0x00007ff116142ad0...>

pry(main)> world_cup.all_players_by_position
# =>
# {
#  :forward=> [#<Player:0x00007ff1160f9c40...>, #<Player:0x00007ff11690db48...>, <Player:0x00007ff1160c2358...>],
#  :midfielder => [#<Player:0x00007ff1168cca08...>, #<Player:0x00007ff116102688...>],
#  :defender => [#<Player:0x00007ff11590da68...>]
# }
```
