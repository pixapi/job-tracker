require 'rails_helper'

RSpec.describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create!(title: "Finance")

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Finance")
  end
end
