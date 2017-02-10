require 'rails_helper'

RSpec.describe "User creates a new category" do
  scenario "a user can create a new category" do
    category_title = "Accounting"
    visit categories_path
    click_on "Add New Category"

    visit new_category_path

    fill_in "category_title", with: category_title
    click_on "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Accounting")
    expect(Category.count).to eq(1)
  end
end
