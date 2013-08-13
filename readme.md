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

Maybe you're crazed and you want to build Wishing Fountains on each of your
twelve farms. That will require 13,104 crafted items.

You can tell Farmer Otto to perform *all* of those steps for you with this script:

```ruby
standard_farm_count.times do
  travel_to_least_recent_farm
  craftshop :open

  # If your craftshop has fewer than 8 stations, the extra
  # get_it clicks will land in neutral space.
  8.times do
    craftshop :get_it
  end

  # Make twice as many drill bits since a Wishing Fountain stage
  # requires 8 drill bits, 4 cut bamboos, and 4 copper tubes.
  craftshop :drill_bit, :count => 4
  craftshop :cut_bamboo, :count => 2
  craftshop :copper_tube, :count => 2

  craftshop :close
end
```

Farmer Otto uses the conventions of the Ruby programming language to specify
what Otto should do. Some of it might look a little geeky, but there are only
a few concepts you need to learn. Check the
[[Wiki|wiki/Ruby-concepts-you-need-to-know]] for some hints.

Still too hard? Let me know; perhaps we can make it even simpler.  If someone
else has already written a script for your task, you might not have to learn
anything – just run the script.

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
