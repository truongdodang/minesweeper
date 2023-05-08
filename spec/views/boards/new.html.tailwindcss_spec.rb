require 'rails_helper'

RSpec.describe "boards/new", type: :view do
  before(:each) do
    assign(:board, Board.new(
      creator_email: "MyString",
      name: "MyString",
      width: 1,
      height: 1,
      mines_num: 1
    ))
  end

  it "renders new board form" do
    render

    assert_select "form[action=?][method=?]", boards_path, "post" do

      assert_select "input[name=?]", "board[creator_email]"

      assert_select "input[name=?]", "board[name]"

      assert_select "input[name=?]", "board[width]"

      assert_select "input[name=?]", "board[height]"

      assert_select "input[name=?]", "board[mines_num]"
    end
  end
end
