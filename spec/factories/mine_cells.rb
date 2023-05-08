# frozen_string_literal: true

FactoryBot.define do
  factory :mine_cell do
    board
    x { Faker::Number.number(digits: 2) }
    y { Faker::Number.number(digits: 2) }
  end
end
