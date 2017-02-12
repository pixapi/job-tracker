class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  # def company_name
  #   if company
  #     company.name
  #   else
  #     "No Company Name"
  #   end
  # end

end
