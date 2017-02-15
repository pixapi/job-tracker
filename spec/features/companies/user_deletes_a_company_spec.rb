require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    company = Company.create(name: "ESPN")
    visit companies_path

    within(".company") do
      click_link "Delete"
    end

    expect(page).to have_content("ESPN was successfully deleted!")
  end
end
