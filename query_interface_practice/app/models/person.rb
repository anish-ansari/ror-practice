class Person < ApplicationRecord
  belongs_to :country
  has_many :company_people
  has_many :companies, through: :company_people
end
