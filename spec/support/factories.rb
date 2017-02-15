FactoryGirl.define do
  factory :company do
    name
  end

  sequence :name do |n|
    "#{n} Company"
  end

  factory :job do
    title
    description
    city
    level_of_interest 4
  end

  sequence :title, ["A", "B", "C"].cycle do |n|
    "#{n} Title"
  end

  sequence :description, ["A", "B", "C"].cycle do |n|
    "#{n} Description"
  end

  sequence :city, ["A", "B", "C"].cycle do |n|
    "#{n} City"
  end
end
