# require 'rails_helper'
#
# describe "User creates a new comment" do
#   scenario "a user can create a new comment" do
#     company = Company.create!(name: "ESPN")
#     job = Job.create!(
#                       title: "CEO",
#                       description: "Expert in management",
#                       city: "London",
#                       level_of_interest: 4,
#                       company_id: company.id,
#                       )
#
#     visit company_job_path(job.company_id, job.id)
#
#     fill_in "comment[author_name]", with: "Maria"
#     fill_in "comment[body]", with: "Inclusive tech company"
#
#     # visit new_company_job_comment_path(job.company_id, job.id)
#     #
#     # expect(current_path).to eq new_company_job_comment_path(job.company_id, job.id)
#
#     # fill_in ""
#
#   end
# end
