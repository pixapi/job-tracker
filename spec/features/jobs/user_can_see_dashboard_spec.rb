require 'rails_helper'

RSpec.describe "User sees the dashboard content" do
  scenario "user can see the dashboard content" do
    # company1 = Company.create!(name: "CocaCola")
    # company2 = Company.create!(name: "Fiat")
    # company3 = Company.create!(name: "Evian")
    # job1 = company1.jobs.create(title: "CEO",
    #                   description: "Expert in management",
    #                   city: "London",
    #                   level_of_interest: 4)
    # job2 = company2.jobs.create(title: "CEO",
    #                   description: "Expert in management",
    #                   city: "London",
    #                   level_of_interest: 4)
    # job3 = company3.jobs.create(title: "CEO",
    #                   description: "Expert in management",
    #                   city: "London",
    #                   level_of_interest: 4)

    company1 = create(:company)
    company2 = create(:company)
    company3 = create(:company)

    job1 = create(:job)
    job2 = create(:job)
    job3 = create(:job)

    job1.company_id = company1.id
    job2.company_id = company2.id
    job3.company_id = company3.id

    visit root_path
    click_on "Jobs Dashboard"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Level of interest: 4 (3)")
    expect(page).to have_content("Evian") #within class when I create class
    expect(page).to have_content("London: 3") #within class when I create class
  end
end
