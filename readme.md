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

For instance, you might want to craft the items required to fully develop
your
[Wishing Fountain](http://farmville.wikia.com/wiki/Wishing_Fountain).
You'll need 609 drill bits, 293 copper tubes, and 293 cut bamboos. That's a 
lot of clicking *Make It* and *Get It*. For top production, you'll also want
to craft on all of your farms. That's a lot of coordinated clicking to move
through all the farms, crafting on each one.

Maybe you're crazed and want the :moneybag:
2.4 million coins :moneybag:, coconuts, and jade from
Wishing Fountains on **all** of your twelve farms. That will require 13,340
crafted items.

You can tell Farmer Otto to craft all those items for you with this script:

```ruby
standard_farm_count.times do
  travel_to_least_recent_farm
  craftshop :open

  # If your craftshop has fewer than 8 stations, the extra
  # get_it clicks will land in neutral space.
  craftshop :get_it, count: 8

  # Make twice as many drill bits since a Wishing Fountain stage
  # requires 15 drill bits, 8 cut bamboos, and 8 copper tubes.
  craftshop :drill_bit,   count: 4
  craftshop :cut_bamboo,  count: 2
  craftshop :copper_tube, count: 2

  craftshop :close
end
```

Farmer Otto uses the conventions of the Ruby programming language to specify
what Otto should do. Some of it might look a little geeky, but there are only
a few concepts you need to learn. Check the
[Wiki](https://github.com/slothbear/farmer_otto/wiki/Ruby-concepts-you-need-to-know)
for some hints.

Still too hard? Let me know; perhaps we can make it even simpler.  If someone
else has already written a script for your task, you might not have to learn
anything – just run the script. Check the scripts directory or the
[Scripts](https://github.com/slothbear/farmer_otto/wiki/Scripts)
page on the Wiki.

## prerequisites

0. Java 5 or later
0. JRuby 1.7 or later
