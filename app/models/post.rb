class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { maximum: 400 }
end
