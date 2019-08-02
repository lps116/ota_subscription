class Plan < ApplicationRecord
  belongs_to :user
  monetize :price_cents
end
