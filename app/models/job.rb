class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_interest
    all.group(:level_of_interest).count.sort.to_h
  end

  def self.sort_jobs_by_company
    by_company = all.group(:company_id).average(:level_of_interest)
    no_bigdecimal = by_company.inject({}) { |h, (k,v)| h[k] = v.floor; h }
    top_three = no_bigdecimal.first(3).to_h
    top_companies = top_three.map do |k, v|
      "#{Company.find(k).name}(#{v})"
    end
    top_companies
  end

  def self.sort_jobs_by_city
    all.group(:city).count.sort.to_h
  end

end
