# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'boards/edit', type: :view do
  let(:board) do
    Board.create!(
      creator_email: 'MyString',
      name: 'MyString',
      width: 1,
      height: 1,
      mines_num: 1
    )
  end

  before(:each) do
    assign(:board, board)
  end

  it 'renders the edit board form' do
    render

    assert_select 'form[action=?][method=?]', board_path(board), 'post' do
      assert_select 'input[name=?]', 'board[creator_email]'

      assert_select 'input[name=?]', 'board[name]'

      assert_select 'input[name=?]', 'board[width]'

      assert_select 'input[name=?]', 'board[height]'

      assert_select 'input[name=?]', 'board[mines_num]'
    end
  end
end
