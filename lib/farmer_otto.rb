require 'yaml'
require 'java'

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

  # spot is a named spot on the farm (@settings from farm.yaml)
  # offset is the x/y offset from the farm's origin
  # point is the absolute x/y on the screen to click

  def click(spot, wait_time=0.0)
    pause?
    offset = @settings.fetch(spot.to_s)

    point= [origin[0]+offset[0], origin[1]+offset[1]]
    puts "click_at: #{spot}: #{point}"

    # @robot.mouseMove(spot[0], spot[1])
    # @robot.delay(200+rand(25))
    # @robot.mousePress(java.awt.event.InputEvent::BUTTON1_MASK)
    # @robot.mouseRelease(java.awt.event.InputEvent::BUTTON1_MASK)
    # @robot.delay(100)
    # @robot.delay(rand(100))

    sleep wait_time
  end

  def origin # fake
    [0, 0]
  end

  def pause?
    sleep 1 while caps_lock?
  end

  def caps_lock?
    tk = java.awt.Toolkit.getDefaultToolkit
    tk.getLockingKeyState(java.awt.event.KeyEvent::VK_CAPS_LOCK)
  end

end
