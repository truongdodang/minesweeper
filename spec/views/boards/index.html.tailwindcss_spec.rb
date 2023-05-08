# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'boards/index', type: :view do
  before(:each) do
    assign(:boards, [
             Board.create!(
               creator_email: 'Creator Email',
               name: 'Name',
               width: 2,
               height: 3,
               mines_num: 4
             ),
             Board.create!(
               creator_email: 'Creator Email',
               name: 'Name',
               width: 2,
               height: 3,
               mines_num: 4
             )
           ])
  end

  it 'renders a list of boards' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Creator Email'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
  end
end
