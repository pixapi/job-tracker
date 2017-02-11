class Comment < ActiveRecord::Base
  validates :author_name, :body, presence: true
  validates :author_name, :body, uniqueness: true
  belongs_to :job
end
