class Company < ApplicationRecord
  belongs_to :country
  has_many :company_people
  has_many :people, through: :company_people
end
