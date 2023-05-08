# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :set_board, :redirect_when_not_found, only: %i[show edit update destroy]

  def index
    @pagy, @boards = pagy(Board.search(params[:term]).order(created_at: :desc), items: 5)
  end

  def show
    @all_cells = AllCellsGenerator.new(board: @board).call
  end

  def new
    @board = Board.new
  end

  def create
    board = BoardCreator.new(board_params).call
    redirect_to board, notice: 'Board was successfully created.'
  rescue StandardError => e
    flash.now[:alert] = e.message
    @board = Board.new(board_params)
    render :new, status: :unprocessable_entity
  end

  def destroy
    @board.destroy
    redirect_to boards_url, notice: 'Board was successfully destroyed.'
  rescue StandardError => e
    redirect_to boards_url, alert: e.message
  end

  private

  def set_board
    @board = Board.find_by(id: params[:id])
  end

  def redirect_when_not_found
    redirect_to '/404' if @board.blank?
  end

  def board_params
    params.require(:board).permit(:creator_email, :name, :width, :height, :mines_num, :term)
  end
end
