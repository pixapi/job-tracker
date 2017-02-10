require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "CocaCola")
    job = Job.create!(
                      title: "CEO",
                      description: "Expert in management",
                      city: "London",
                      level_of_interest: 4,
                      company_id: company.id,
                      )

    new_title = "CFO"

    visit company_job_path(company, job)
    click_on "Edit"

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: new_title
    click_on "Update"

    expect(current_path).to eq company_job_path(company, job)
    expect(page).to have_content("CocaCola")
    expect(page).to_not have_content("CEO")
  end
end
