class Post < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy
end
