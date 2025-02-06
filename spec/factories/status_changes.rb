FactoryBot.define do
  factory :status_change do
    old_status { "MyString" }
    new_status { "MyString" }
    user { nil }
    project { nil }
  end
end
