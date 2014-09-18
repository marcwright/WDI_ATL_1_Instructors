class Display
  def initialize(options)
    @options = options
  end

  def print(*strings)
    puts "", strings, ""
  end

  def print_values(values_arr, intro = nil)
    # prints out a bullet point for each value in an array
    intro ? puts("", intro) : puts("")
    values_arr.each { |value| puts "* #{ value }" unless value }
    puts
  end

  def print_menu
    # shows a user menu
    puts "", "Please select an option: "
    @options.each { |select_key, text| puts "(#{ select_key }) #{ text }" }
    puts
  end
end
