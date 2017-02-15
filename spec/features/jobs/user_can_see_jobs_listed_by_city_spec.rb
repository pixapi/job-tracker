require 'rails_helper'

RSpec.describe "User sees jobs listed by city" do
  scenario "user can see jobs listed by city" do
    company1 = Company.create!(name: "CocaCola")
    company2 = Company.create!(name: "Fiat")
    company3 = Company.create!(name: "Evian")
    job1 = company1.jobs.create(title: "CEO",
                      description: "Expert in management",
                      city: "London",
                      level_of_interest: 4)
    job2 = company2.jobs.create(title: "CEO",
                      description: "Expert in management",
                      city: "London",
                      level_of_interest: 4)
    job3 = company3.jobs.create(title: "CEO",
                      description: "Expert in management",
                      city: "London",
                      level_of_interest: 4)

    visit dashboard_path
    click_on "See all jobs listed by city"

    expect(current_path).to eq('/jobs')
    expect(page).to have_content('CEO at CocaCola')
  end
end
