class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  self.inheritance_column = :_type_disabled
  validates :date,presence: true
  validates :type,presence: true
  validates :category_id, presence: true
  validates :amount, {presence: true, numericality: { greater_than_or_equal_to: 1 }}
  validates :note,presence: true, length:{maximum: 200}
end
