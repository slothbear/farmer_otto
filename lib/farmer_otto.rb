require 'yaml'
require 'java'

FARMVILLE_COM_WIDTH = 770
FARMVILLE_COM_HEIGHT = 600

class FarmerOtto

  def initialize
    @settings = YAML::load_file('farm.yaml')
    @robot = java.awt.Robot.new
  end

  def run_script(path)
    puts "sleeping for 5 seconds..."
    sleep 5.0
    instance_eval(File.read(path), path)
  end

  def travel_to(farm)
    return if farm == @current_farm
    puts "travelling to #{farm}"

    click :travel_button
    get_route_to(farm).each do |step|
      click step, 1.0
    end

    @current_farm = farm
    sleep 14.0
  end

  def current_farm(farm)
    @current_farm = farm || :home
  end

  def craftshop(request)
    puts "craftshop (#{@current_farm}: #{request})"

    case request

    when :look_inside
      zoom_out
      shop = @settings.fetch('craftshops').fetch(@current_farm.to_s)
      look_inside shop
    when :close
      click :craftshop_close
      sleep 0.5

    else
      raise "unrecognized request: #{request}"
    end
  end

  private

  def get_route_to(farm)
    @settings.fetch('routes').fetch(farm.to_s)
  end

  # spot is a named spot on the farm (@settings from farm.yaml)
  # offset is the x/y offset from the farm's origin
  # point is the absolute x/y on the screen to click

  def click(spot, wait_time=0.0)
    print "click #{spot.inspect}:"
    pause?

    if spot.kind_of?(Symbol) || spot.kind_of?(String)
      offset = @settings.fetch(spot.to_s)
    elsif spot.kind_of?(Array)
      offset = spot
    else
      raise "Unable to click: #{spot.inspect}"
    end

    point = [origin[0]+offset[0], origin[1]+offset[1]]
    puts "click #{spot}: #{point.inspect}"

    @robot.mouseMove(point[0], point[1])
    @robot.delay(200+rand(25))
    @robot.mousePress(java.awt.event.InputEvent::BUTTON1_MASK)
    @robot.delay(25)
    @robot.mouseRelease(java.awt.event.InputEvent::BUTTON1_MASK)
    @robot.delay(100)
    @robot.delay(rand(100))

    sleep wait_time
  end

  def origin
    @origin ||= find_farm
  end

  def find_farm
    dim = java.awt.Toolkit.getDefaultToolkit.getScreenSize
    screen = snapshot(0, 0, dim.getWidth, dim.getHeight)
    border_color = java.awt.Color.new(19, 15, 11).getRGB

    (0...dim.getHeight-FARMVILLE_COM_HEIGHT).each do |row|
      row_pixels = screen.getRGB(0,row,dim.getWidth,1,nil,0,dim.getWidth)
      (0..dim.getWidth-FARMVILLE_COM_WIDTH).each do |column|
        return [column-2, row+1] if row_pixels[column, 400].all? {|pixel| pixel == border_color}
      end
    end

    raise "Unable to locate farm on the screen."
  end

  def snapshot(rx, ry, rw, rh)
    field = java.awt.Rectangle.new(rx,ry,rw,rh)
    @robot.createScreenCapture(field)
  end

  def pause?
    sleep 1 while caps_lock?
  end

  def caps_lock?
    tk = java.awt.Toolkit.getDefaultToolkit
    tk.getLockingKeyState(java.awt.event.KeyEvent::VK_CAPS_LOCK)
  end

  def look_inside(item)
    click item
    sleep 0.5
    click [item[0]+47, item[1]+10]
    sleep 4.0
  end

  def zoom_out
    10.times { click :zoom_out }
    # really need 8
    # extra times don't hurt, might help: switch to FV window
  end

end
