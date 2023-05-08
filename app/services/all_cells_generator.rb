# frozen_string_literal: true

class AllCellsGenerator
  attr_reader :board

  def initialize(board:)
    @board = board
  end

  def call
    raise 'Could not generate all cells without board info.' if board.blank?

    all_cells = {}

    # initialize
    board.height.times do |y|
      board.width.times do |x|
        key = [x, y]
        all_cells[key] = false
      end
    end

    # update
    board.mine_cells.each do |mine_cell|
      key = [mine_cell.x, mine_cell.y]
      all_cells[key] = true
    end

    all_cells

    # # Array[][]
    # # initialize
    # all_cells = Array.new(board.height) { Array.new(board.width) }

    # # update
    # board.mine_cells.each do |mine_cell|
    #   all_cells[mine_cell.y][mine_cell.x] = true
    # end

    # all_cells
  end
end
