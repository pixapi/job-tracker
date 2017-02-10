require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category1 = Category.create!(title: "Engineering")
    category2 = Category.create!(title: "Education")

    visit categories_path

    expect(page).to have_content("Engineering")
    expect(page).to have_content("Education")
  end
end
