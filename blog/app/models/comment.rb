class Comment < ApplicationRecord
  # associating with article model
  belongs_to :article

  # associating with user model
  belongs_to :user
end
