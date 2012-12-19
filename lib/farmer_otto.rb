class FarmerOtto

  def initialize

  end

  def run_script(path)
    instance_eval(File.read(path), path)
  end

  def travel_to(farm)
    puts "travelling to #{farm}"
  end

  def craftshop(*args)
    puts "craft shop performing: #{args.inspect}"
  end

end
