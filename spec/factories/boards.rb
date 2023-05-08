FactoryBot.define do
  factory :board do
    creator_email { "MyString" }
    name { "MyString" }
    width { 1 }
    height { 1 }
    mines_num { 1 }
  end
end
