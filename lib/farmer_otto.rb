require 'yaml'
require 'java'

FARMVILLE_COM_WIDTH = 770
FARMVILLE_COM_HEIGHT = 600
CRAFT_WAIT = 2.5
$DEBUG = false

class FarmerOtto

  def initialize(args)
    @args = args
    @settings = YAML::load_file('farm.yaml')
    @robot = java.awt.Robot.new
    @click_count = 0
  end

  def args
    @args
  end

  def run_script(path)
    instance_eval(File.read(path), path)
    activate_farm
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
      additional_time = 5
      system %[say "#{additional_time}"]
      puts "wait: additional #{additional_time} seconds"
      sleep additional_time
    end
  end

  def activate_farm
    wait 0.1
    click [700, -20], 1.0
  end

  # Farms are ordered by most recently used
  # Assume we want to loop back to least recently used.
  # Manually visit HG to make it the most recently used, then travel
  # to the other farms by visiting the right-most farm.

  # There are currently 15 plowable farms.
  # Minus 3 for the farms displayed when travel dialog appears.
  # Divided by 3 per screen. # => magic number 4
  # Upon the next new farm, it will be Magic 5 +  travel_spot_1.
  def travel_to_least_recent_farm
    click :travel_button, 1.0
    4.times { click :travel_right, 0.5 }
    click :travel_spot_3, 20.0
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

  def tin_man_fountain(*request)
    click_list request
  end

  def click_arabian_stallions(*request)
    click_list request
  end

  def azure_emporium(*request)
    click_list request
  end

  def farmers_square(*request)
    click_list request
  end

  def get_craft_item_spot(item)
    # row 1: [x, 386] 2: [x, 518]
    # col 1: [216, y], 2: [438, y], 3: [660, y]
    xs = [216, 438, 660]
    ys = [386, 518]
    h = @settings.fetch(item.to_s)
    x = xs[h["column"]-1]
    y = ys[h["row"]-1]
    return h["page"], [x, y]
  end

  def craftshop(request, options={})
    puts "craftshop (#{request}, #{options.inspect})"
    count = options[:count] || 1

    case request

    when :open
      click :building_button, 0.4
      click :craftshop_button, 5.0

    when :get_it
      count.times do
        click :craft_get_it, CRAFT_WAIT
        click :craft_close_share, 1.0
      end

    when :drill_bit, :copper_tube, :cut_bamboo, :two_large_fuels, :farmhand
      case request
      when :two_large_fuels, :farmhand
        category = :consumables_category
      else
        category = :parts_category
      end

      click category, CRAFT_WAIT, :extra_hard
      click category, CRAFT_WAIT, :extra_hard

      page, spot = get_craft_item_spot(request)

      # We're already on page one, so subtract 1.
      (page-1).times do
        click :craft_right_arrow, 1.0
      end
      click spot, 2.0

      count.times do
        click :craft_make_it, CRAFT_WAIT
        click :craft_close_share, 1.0
      end

    when :close
      click :craftshop_close, 0.5

    else
      raise "unrecognized request: #{request}"
    end
  end

  def close_farm_cash_offer
    click [576, 88], 1.0
  end

  def debug(switch=true)
    $DEBUG = switch
  end

  def harvest_basic_nail
    click :fs_supply_shop
  end

  private

  # spot is a named spot on the farm (@settings from farm.yaml)
  # offset is the x/y offset from the farm's origin
  # point is the absolute x/y on the screen to click

  def click(spot, wait_time=0.0, extra_hard=false)
    @click_count += 1
    print "click #{spot.inspect}:"
    pause?
    if $DEBUG
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

  def farm_count
    @farm_count ||= @settings['farm_codes'].keys.size
  end

  def click_list(list)
    list.each do |point|
      extra_hard = (point == :lumber_mill_tab || point == :supply_shop_tab)
      click point, 2.0, extra_hard
      puts "sleep 2.0"
    end
  end

end
