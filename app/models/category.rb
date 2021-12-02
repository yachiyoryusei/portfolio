class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :users
  validates :name, presence: true, length: {maximum: 50 }
end
