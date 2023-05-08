# frozen_string_literal: true

class BoardCreator
  attr_reader :options

  def initialize(options)
    @options = options
  end

  def call
    ActiveRecord::Base.transaction do
      board = Board.create!(options)
      MineCellsCreator.new(board:).call
      board
    end
  end
end
