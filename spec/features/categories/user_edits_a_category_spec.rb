require 'rails_helper'

RSpec.describe "User edits a category" do
  scenario "a user can edit a category" do
    category = Category.create(title: "Cooking")
    updated_category = "Music"

    visit categories_path
    click_on "Edit"

    visit edit_category_path(category)
    fill_in "category[title]", with: updated_category
    click_on "Update Category"

    expect(current_path).to eq category_path(category)
    expect(page).to have_content(updated_category)
    expect(page).to_not have_content("Cooking")
  end
end
