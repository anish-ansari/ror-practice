class Article < ApplicationRecord
  # associating with comment model
  # what dependent: :destroy does is deletes comments if an article is deleted
  has_many :comments, dependent: :destroy

  # associating with user model
  belongs_to :user

  # validator for title, if  < 5 then no @article.save
  validates :title, presence: true, length: { minimum: 5 }
end
