class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :articles

  validates :content, presence: true
end
