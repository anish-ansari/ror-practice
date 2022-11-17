class Country < ApplicationRecord
  has_many :people
  has_many :companies
end
