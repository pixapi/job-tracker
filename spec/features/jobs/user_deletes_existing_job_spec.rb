require 'rails_helper'

describe "User deletes an existing job" do
  scenario "a user can delete a job" do
    company = Company.create!(name: "CocaCola")
    job = Job.create!(
                      title: "CEO",
                      description: "Expert in management",
                      city: "London",
                      level_of_interest: 4,
                      company_id: company.id,
                      )

    visit company_job_path(company, job)
    click_on "Delete"

    expect(page).to_not have_content("Expert in management")
    expect(current_path).to eq company_jobs_path(company)
  end
end
