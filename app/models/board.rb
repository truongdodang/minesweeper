# frozen_string_literal: true

class Board < ApplicationRecord
  has_many :mine_cells, dependent: :delete_all

  # maximum of the board's width and height
  MAX_WIDTH = 1000

  validates :creator_email, :name, :width, :height, :mines_num, presence: true
  validates_format_of :creator_email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :width, :height, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: MAX_WIDTH }
  validates :mines_num, numericality: {
    only_integer: true, greater_than: 0, less_than_or_equal_to: ->(board) { board.width * board.height }
  }, if: -> { width && width.positive? && height && height.positive? }

  def self.search(term)
    if term
      where('name ILIKE ? OR creator_email ILIKE ?', "%#{term}%", "%#{term}%")
    else
      all
    end
  end
end
