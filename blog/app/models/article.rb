class Article < ApplicationRecord
  # validator for title, if  < 5 then no @article.save
  validates :title, presence: true, length: { minimum: 5 }
  # validates :text, presence: true
end
