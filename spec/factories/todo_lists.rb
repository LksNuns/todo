FactoryGirl.define do
  factory :todo_list do
    sequence(:title) { |n| "title#{n}" }
    privacy false

    factory :private_todo do
      privacy true
    end

  end
end
