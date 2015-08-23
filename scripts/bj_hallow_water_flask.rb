blackjack_barn

harvest :leaf_basket
harvest :mischief_pump
wait 3
harvest :leaf_basket
harvest :mischief_pump

unless first_run?
  harvest :hallowed_fountain
  open :stockroom
  sell :sell_spot_1
end

open :hallowed_fountain
make :hallowed_water_flask

wait 7
