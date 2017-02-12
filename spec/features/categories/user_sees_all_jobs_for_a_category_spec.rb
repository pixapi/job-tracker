require 'rails_helper'

RSpec.describe "User sees all jobs for a category" do
  scenario "a user can see all jobs for a category" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Management")
    job1 = Job.create!(
                      title: "CEO",
                      description: "Expert in management",
                      city: "London",
                      level_of_interest: 4,
                      company_id: company.id,
                      category_id: category.id,
                      )
    job2 = Job.create!(
                      title: "CFO",
                      description: "Expert in management",
                      city: "Paris",
                      level_of_interest: 5,
                      company_id: company.id,
                      category_id: category.id,
                      )
    # job1.category.create!(category_id: category.id)
    # job2.category.create!(category_id: category.id)

    visit category_path(category)

    expect(page).to have_content("CEO")
    expect(page).to have_content("CFO")
  end
end
