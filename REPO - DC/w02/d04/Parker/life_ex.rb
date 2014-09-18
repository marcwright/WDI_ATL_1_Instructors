class GameOfLifeStateMachine
    DEATH = [0, 1, 4, 5, 6, 7, 8]
    LIFE = [2, 3]
    BIRTH = [3]

    LIVING_CELL = 1
    DEAD_CELL = 0

    def self.next_state(previous, alive_neighbours)
        case previous
        when DEAD_CELL
            if BIRTH.include? alive_neighbours
                LIVING_CELL
            else
                DEAD_CELL
            end
        when LIVING_CELL
            if DEATH.include? alive_neighbours
                DEAD_CELL
            else
                LIVING_CELL
            end
        else
            DEAD_CELL
        end
    end
end


class GameOfLife
    attr_reader :grid

    def initialize(rows, columns)
        @rows = rows
        @columns = columns
        @grid = Array.new(rows) {Array.new(columns,
GameOfLifeStateMachine::DEAD_CELL)}
    end

    # State is an array of arrays containing points to make alive
    def set_initial_state(state)
        state.each {|a,b|
@grid[a][b]=GameOfLifeStateMachine::LIVING_CELL}
    end

    def next_state
        new_grid = []
        @grid.each_with_index do |row, i|
            new_row = []
            row.each_with_index do |column, j|
                new_row <<
GameOfLifeStateMachine.next_state(@grid[i][j], alive_neighbours(i,j))
            end
            new_grid << new_row
        end
        @grid = new_grid
    end

    def alive_neighbours(row, column)
        count = 0
        (-1..1).each do |i|
            (-1..1).each do |j|
                next if (i.zero? and j.zero?)
                row_index = row + i
                col_index = column + j
                if row_index >= 0 and row_index < @rows and col_index
>= 0 and col_index < @columns
                    count += 1 if @grid[row_index][col_index] ==
GameOfLifeStateMachine::LIVING_CELL
                end
            end
        end
        count
    end


    def to_s
        s = ""
        @grid.each {|row| row.each {|col| s << col.to_s << " "}; s <<
"\n"}
        s
    end
end

rows = 10
cols = 20
game = GameOfLife.new rows,cols


# Oscillators
#game.set_initial_state([[5,5],[5,6],[5,7]])
#game.set_initial_state([[5,5],[5,6],[5,7],[6,4],[6,5],[6,6]])

# Glider
game.set_initial_state([[0,1],[1,2],[2,0],[2,1],[2,2]])

puts game.to_s.gsub(/1/,"#")
puts


while true
#    puts "Press enter for next state"
#    gets
    game.next_state
    puts game.to_s.gsub(/1/,"#")
    puts "-" * cols
    sleep(0.5)
end