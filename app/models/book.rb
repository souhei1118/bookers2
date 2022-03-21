class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true , length: { maxium: 200 }
end
