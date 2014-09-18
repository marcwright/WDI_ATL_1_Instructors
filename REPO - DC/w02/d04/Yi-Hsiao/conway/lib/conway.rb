require "pry"

class Conway
  attr_reader :curr_phase, :next_phase

  def initialize(curr_phase = {})
    @curr_phase = curr_phase
    @next_phase = {}
    @standstill = false
  end

  def add_cell(x_pos, y_pos, phase=@curr_phase)
    # add cell with a (x, y) coordinate and remember its location
    # stored as a hash in the format {x_coordinate: [array of y_coordinates]}
    @standstill = false

    if phase.has_key?(x_pos)
      # add cell only if it's unique
      phase[x_pos].push(y_pos).uniq!
    else
      phase[x_pos] = [y_pos]
    end
  end

  def count_neighbors(target_x, target_y)
    # check for neighboring cells within 1 unit of a given (x, y) coordinate
    adj_y = (target_y - 1..target_y + 1) # adjacent y-values

    @curr_phase.reduce(0) do |count, (col_x, all_cell_y)|
      # find all adjacent cells except for itself
      case (col_x - target_x).abs
      when 0 then count + (all_cell_y & adj_y.to_a - [target_y]).length
      when 1 then count + (all_cell_y & adj_y.to_a).length
      else count
      end
    end
  end

  def will_live?(x_pos, y_pos)
    # Determines who will live and die next turn based on Conway's Game of Life
    num_neighbors = count_neighbors(x_pos, y_pos)

    # checks if this cell is alive or not
    if @curr_phase.has_key?(x_pos) && @curr_phase[x_pos].include?(y_pos)
      # if alive and has 2-3 neighbors, then it survives, else it dies
      (2..3).cover?(num_neighbors) ? true : false
    else
      # if not yet alive and has exactly 3 neighbors, it will come alive
      num_neighbors == 3 ? true : false
    end
  end

  def get_coords_to_scan
    # returns unique coords for all living cells and any empty cells adjacent to a living cell

    # a growing record of what x-values to scan in the format {x_coordinate: [array of y-values]}
    # as x-values are checked, they will be inserted into the hash
    slots_to_check = {}

    @curr_phase.each do |cell_x, cell_y_coords|
      # check all adjacent x-values, except x-values we've already looked at
      x_vals_to_scan = Array(cell_x - 1..cell_x + 1) - slots_to_check.keys
      x_vals_to_scan.each do |curr_x|
        # look for all unique adjacent y-values for each x-value
        slots_to_check[curr_x] = cell_y_coords.map { |y_pos| Array(y_pos - 1..y_pos + 1) }.flatten.uniq
      end
    end

    return slots_to_check
  end

  def update_phase
    # get all (x, y) coordinates that need to be checked
    return if @standstill

    x_y_checks = get_coords_to_scan
    x_y_checks.each do |x_pos, y_coords|
      y_coords.each do |y_pos|
        # compiles the next phase
        add_cell(x_pos, y_pos, @next_phase) if will_live?(x_pos, y_pos)
      end
    end

    @standstill = true if @curr_phase == @next_phase # if there's no evolution, then set a standstill flag
    @curr_phase, @next_phase = @next_phase, {} # commits the changes
  end
end
