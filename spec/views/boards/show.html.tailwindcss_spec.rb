require 'rails_helper'

RSpec.describe "boards/show", type: :view do
  before(:each) do
    assign(:board, Board.create!(
      creator_email: "Creator Email",
      name: "Name",
      width: 2,
      height: 3,
      mines_num: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Creator Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
