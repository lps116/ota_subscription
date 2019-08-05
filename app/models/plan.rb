class Plan < ApplicationRecord
  belongs_to :user
  has_many :orders
  monetize :price_cents
end
