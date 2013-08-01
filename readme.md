Farmer Otto
===

#### Farmer Otto thanks these great projects:
<table>
  <tr>
    <td>
      <a href="http://www.ruby-lang.org/en/">
        Ruby
      </a>
    </td>
    <td>
      <a href="http://jruby.org/">JRuby
      </a>
    </td>
    <td>
      <a href="http://company.zynga.com/games/farmville">
        Zynga/Farmville
      </a>
    </td>
  </tr>
</table>

Farmer Otto is a set of tools for automating common tasks in Farmville.

For instance, you might want to craft the items required to fully build your
[Wishing Fountain](http://farmville.wikia.com/wiki/Wishing_Fountain).
You'll need 546 drill bits, 273 copper tubes, and 273 cut bamboos. That's a lot of clicking *Make It* and *Get It*. For top production, you'll also want to craft on all of your farms. That's a lot of coordinated clicking to move through all the farms.

Maybe you're crazed and you want to build Wishing Fountains on each of your seven farms. That would require 7,644 crafted items.

You can tell Farmer Otto to perform *all* of those steps for you with this script:

```ruby

farms = :home, :english, :lighthouse, :winter, :hawaiian, :jade, :haunted
current_farm :home

farms.each do |farm|
  travel_to farm

  craftshop :look_inside
  3.times { craftshop :get_it }

  craftshop :drill_bit
  craftshop :copper_tube
  craftshop :cut_bamboo

  craftshop :close
end
```

**Note**: *Farmville now allows multiple units of the same
item to be crafted in the same Craftshop... so the example
script needs some refactoring.*

Farmer Otto uses the conventions of the Ruby programming language to specify what Otto should do. Some of it might look a little geeky, but there are only a few concepts you need to learn. Check the Wiki for tutorials.

Still too hard? Let me know; perhaps we can make it even simpler.  If someone else has already written a script for your task, you might not have to learn anything -- just run it.

## prerequisites

0. Java 5 or later
0. JRuby 1.6.5.1 or later
0. craftshop locations (`farm.yaml`)
0. sufficient bushels for full run, per farm:
  * 3 raspberry, 2 pumpkin, 1 apple wood
  * 3 wheat, 3 spinach, 1 milk
  * 3 peanut, 4 cotton, 1 lemon
0. for 7 farms:
  * 21 raspberry, 14 pumpkin, 7 apple wood
  * 21 wheat, 21 spinach, 7 milk
  * 21 peanut, 28 cotton, 7 lemon
