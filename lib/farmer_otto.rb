require 'yaml'

class FarmerOtto

  def initialize
    @settings = YAML::load_file('farm.yaml')
  end

  def run_script(path)
    instance_eval(File.read(path), path)
  end

  def travel_to(farm)
    puts "travelling to #{farm}"
    @current_farm ||= farm
    return farm if farm == @current_farm

    click :travel_button
    get_route_to(farm).each do |step|
      click step, 0.5
    end
    sleep 1.0  # sleep 14.0
    click :close_farm_cash_offer
  end

  def craftshop(*args)
    puts "craft shop performing: #{args.inspect}"
  end

  private

  def get_route_to(farm)
    @settings.fetch('routes').fetch(farm.to_s)
  end

  def click(spot, wait=0)
    puts "click: #{spot} and wait: #{wait}"
  end

end
