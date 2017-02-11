class Contact < ActiveRecord::Base
  validates :first_name, :last_name, :position, :e_mail, presence: true
  validates :e_mail, uniqueness: true

  belongs_to :company
end
