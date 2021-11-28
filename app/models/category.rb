class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :users, dependent: :destroy
end
