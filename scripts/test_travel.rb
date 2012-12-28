farms = :home, :english, :lighthouse, :winter,
  :hawaiian, :jade, :haunted, :home

current_farm :home

farms.each do |farm|
  travel_to farm
end