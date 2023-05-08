# frozen_string_literal: true

width = Faker::Number.number(digits: 2)
height = Faker::Number.number(digits: 2)

FactoryBot.define do
  factory :board do
    creator_email { Faker::Internet.email }
    name { Faker::Name.name }
    width { width }
    height { height }
    mines_num { Faker::Number.between(from: 1, to: width * height) }
  end
end
