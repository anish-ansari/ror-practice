class Article < ApplicationRecord
  # validator for title, if  < 5 then no @article.save
  validates :title, presence: true, length: { minimum: 5 }
  # validates :text, presence: true

  # associating with comment model
  # what dependent: :destroy does is deletes comments if an article is deleted
  has_many :comments, dependent: :destroy

  # associating with user model
  belongs_to :user
end
