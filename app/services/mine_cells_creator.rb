# frozen_string_literal: true

class MineCellsCreator
  attr_reader :board

  def initialize(board:)
    @board = board
  end

  def call
    raise 'Could not create mine cells without board info.' if board.blank?

    mine_cells_data = mine_cells.map { |cell| { x: cell[0], y: cell[1] } }
    board.mine_cells.create!(mine_cells_data)
  end

  private

  def mine_cells
    return @mine_cells if @mine_cells.present?

    @mine_cells = []
    max_mines = [board.mines_num, board.width * board.height].min
    set_mines = 0
    while set_mines < max_mines
      position = random_position
      unless @mine_cells.include? position
        @mine_cells << position
        set_mines += 1
      end
    end
    @mine_cells
  end

  def random_position
    [rand(board.width), rand(board.height)]
  end
end
