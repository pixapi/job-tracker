require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create a new comment" do
    company = Company.create!(name: "ESPN")
    job = Job.create!(
                      title: "CEO",
                      description: "Expert in management",
                      city: "London",
                      level_of_interest: 4,
                      company_id: company.id,
                      )

    visit company_job_path(job.company_id, job.id)

    fill_in "comment[author_name]", with: "Maria"
    fill_in "comment[body]", with: "Inclusive tech company"
    click_on "Add Comment"

    expect(current_path).to eq company_job_path(job.company_id, job.id)
    expect(page).to have_content("Maria")
    expect(page).to have_content("Inclusive tech company")
  end
end
