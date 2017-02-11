require 'rails_helper'

RSpec.describe "User creates a new contact" do
  scenario "user can create a new contact" do
    company = Company.create!(name: "ESPN")
    job = Job.create!(
                      title: "CEO",
                      description: "Expert in management",
                      city: "London",
                      level_of_interest: 4,
                      company_id: company.id,
                      )

    visit company_jobs_path(company)

    fill_in "contact[first_name]", with: "Megan"
    fill_in "contact[last_name]", with: "Rome"
    fill_in "contact[position]", with: "Hiring Manager"
    fill_in "contact[e_mail]", with: "mrome@github.com"

    click_on "Add Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content "Megan"
    expect(page).to have_content "mrome@github.com"
  end
end
