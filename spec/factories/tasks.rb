FactoryBot.define do
  factory :task do
    title { "title" }
    content { "test" }
    user { create(:user) }
    end_date { "2018-12-31 12:34:56" }
  end
end
