require 'rails_helper'

RSpec.describe "User deleletes a category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "Sport Trainer")
    visit categories_path
    click_on "Delete"

    visit categories_path

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content("Sport Trainer")
  end
end
