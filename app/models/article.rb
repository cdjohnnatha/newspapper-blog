# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
end
