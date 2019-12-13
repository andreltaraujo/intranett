FactoryBot.define do
  factory :task do
    name { "MyString" }
    start_date { "2019-12-08" }
    end_date { "2019-12-08" }
    task_field { "MyText" }
    status { 1 }
    rmk { "MyText" }
    user { nil }
  end
end
