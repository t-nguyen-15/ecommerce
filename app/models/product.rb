class Product < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
end
