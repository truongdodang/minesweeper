# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/boards', type: :request do
  let(:valid_attributes) do
    {
      creator_email: 'truong@example.com',
      name: 'Board 1',
      width: 5,
      height: 15,
      mines_num: 10
    }
  end

  let(:invalid_attributes) do
    {
      creator_email: 'truong',
      name: '',
      width: 0,
      height: 0,
      mines_num: 10
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Board.create! valid_attributes
      get boards_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    context 'with invalid parameters' do
      it 'renders a successful response' do
        board = Board.create! valid_attributes
        get board_url(board)
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it 'redirects to /404 ' do
        board = Board.create! valid_attributes
        board = board.destroy
        get board_url(board)
        expect(response).to redirect_to('/404')
      end
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_board_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Board' do
        expect do
          post boards_url, params: { board: valid_attributes }
        end.to change(Board, :count).by(1)
      end

      it 'redirects to the created board' do
        post boards_url, params: { board: valid_attributes }
        expect(response).to redirect_to(board_url(Board.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new board' do
        expect do
          post boards_url, params: { board: invalid_attributes }
        end.to change(Board, :count).by(0)
      end

      it "renders 'new' with 422 status" do
        post boards_url, params: { board: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'with valid parameters' do
      it 'destroys the requested board' do
        board = Board.create! valid_attributes
        expect do
          delete board_url(board)
        end.to change(Board, :count).by(-1)
      end

      it 'redirects to the boards list' do
        board = Board.create! valid_attributes
        delete board_url(board)
        expect(response).to redirect_to(boards_url)
      end
    end

    context 'with invalid parameters' do
      it 'redirects to /404 ' do
        board = Board.create! valid_attributes
        board = board.destroy
        delete board_url(board)
        expect(response).to redirect_to('/404')
      end
    end
  end
end
