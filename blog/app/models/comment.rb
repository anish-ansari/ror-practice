class Comment < ApplicationRecord
  # associating with article model
  belongs_to :article
end
