Farmer Otto
===

Farmer Otto is a set of tools for automating common tasks in Farmville.

For instance, you might want to craft the items required to fully build your Wishing Fountain. In total, you'll need 546 drill bits, 273 copper tubes, and 273 cut bamboos. That's a lot of clicking *Make It* and *Get It*. For top production, you'll also want to craft on all of your farms. That's a lot of coordinated clicking to move through all the farms.

You can tell Farmer Otto to perform *all* of those steps for you with this small program:

````
farms.each do |farm|
  travel_to farm
  craftshop open
  3.times { craftshop get_it }
  craftshop craft, :drill_bit, :copper_tube, :cut_bamboo
  craftshop close
end
````

Farmer Otto uses the conventions of the Ruby programming language to specify what Otto should do. Some of it might look a little geeky, but there are only a few concepts you need to learn. Check the Wiki for tutorials.

Still too hard? Let me know; perhaps we can make it even simpler.