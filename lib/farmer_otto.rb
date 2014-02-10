require 'yaml'
require 'java'

FARMVILLE_COM_WIDTH = 770
FARMVILLE_COM_HEIGHT = 600
CRAFT_WAIT = 2.5
DEBUG = false

class FarmerOtto

  def initialize
    @settings = YAML::load_file('farm.yaml')
    @robot = java.awt.Robot.new
    @click_count = 0
  end

  def run_script(path)
    instance_eval(File.read(path), path)
    puts "----- WRAP UP"
    puts "total clicks: #{@click_count}"
  end

  def close_farmville_tab
    # TODO: the point (close_fv_window) should know it is absolute
    click :close_farmville_tab, 999
  end

  def wait(minutes)
    puts "wait: #{minutes} minutes"
    sleep minutes*60

    if minutes >= 1  # fuzz factor for longer operations
      # And alert user to reactivate Farmville window
      system 'say "10 seconds"'
      puts "wait: additional 10 seconds"
      sleep 5
    end
  end

  def activate_farm
    click [580, -15]
  end

  # Farms are ordered by most recently used
  # Assume we want to loop back to least recently used.
  # Manually visit HG to make it the most recently used, then travel
  # to the other farms by visiting the right-most farm.

  def travel_to_least_recent_farm
    click :travel_button, 1.0
    least_recent_farm_clicks.times { click :travel_right }
    click :travel_spot_3, 14.0
  end

  def apothecary(*request)
    click_list request
  end

  def elite_horses(*request)
    click_list request
  end

  def jungle_hideaway(*request)
    click_list request
  end

  def hollybright(*request)
    click_list request
  end

  def craftshop(request, options={})
    puts "craftshop (#{request}, #{options.inspect})"

    case request

    when :open
      click :building_button, 0.4
      click :craftshop_button, 5.0

    when :get_it
      click :craft_get_it, CRAFT_WAIT
      click :craft_close_share, 1.0

    when :drill_bit, :copper_tube, :cut_bamboo, :large_crowbar
      click :parts_category, CRAFT_WAIT, :extra_hard
      click :parts_category, CRAFT_WAIT, :extra_hard

      craft_page = request == :large_crowbar ? 3 : 2
      craft_page.times do
        click :craft_right_arrow, 1.0
      end

      selected_craft = "select_#{request}"
      click selected_craft, 2.0
      count = options[:count].to_i
      count.times do
        click :craft_make_it, CRAFT_WAIT
        click :craft_close_share, 1.0
      end
      click :craft_item_close

    when :close
      click :craftshop_close, 0.5

    else
      raise "unrecognized request: #{request}"
    end
  end

  private

  # spot is a named spot on the farm (@settings from farm.yaml)
  # offset is the x/y offset from the farm's origin
  # point is the absolute x/y on the screen to click

  def click(spot, wait_time=0.0, extra_hard=false)
    @click_count += 1
    print "click #{spot.inspect}:"
    pause?
    if DEBUG
      puts spot
      return
    end

    if spot.kind_of?(Symbol) || spot.kind_of?(String)
      offset = @settings.fetch(spot.to_s)
    elsif spot.kind_of?(Array)
      offset = spot
    else
      raise "Unable to click: #{spot.inspect}"
    end

    point = if wait_time == 999
      offset # TODO: this is no longer an offset.
    else
      [origin[0]+offset[0], origin[1]+offset[1]]
    end
    puts "#{point.inspect}"

    @robot.mouseMove(point[0], point[1])
    @robot.delay(200+rand(25))
    @robot.mousePress(java.awt.event.InputEvent::BUTTON1_MASK)
    @robot.delay(50)
    @robot.delay(100) if extra_hard
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
    click item, 0.5
    click [item[0]+47, item[1]+10], 4.0
  end

  def zoom_out
    10.times { click :zoom_out }
    # really need 8
    # extra times don't hurt, might help by auto-switching into FV window
  end

  # How many standard farms are there?
  # answer: total numnber of farms minus Hanging Gardens and the Featured Farm

  # This count is used when we want to perform an action on every standard
  # farm: Buy Goods, Harvest Wishing Fountain, Craft Drill Bits.

  # Standard farm: All farms that can be reached via the row of three
  # farms in the travel dialog, except for Hanging Gardens. The Featured
  # farm (big box at top of dialog) is not counted as a standard farm.
  # Future version: include the Featured Farm in our travel plans.

  def standard_farm_count
    @standard_farm_count ||= farm_count-2
  end

  def least_recent_farm_clicks
    standard_farm_count - 3   # 3 farms displayed when dialog appears
  end

  def farm_count
    @farm_count ||= @settings['farm_codes'].keys.size
  end

  def click_list(list)
    list.each do |point|
      click point, 2.0
      puts "sleep 2.0"
    end
  end

end
