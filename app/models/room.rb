class Room < ApplicationRecord
  validates :name, format: { with: /\A[a-z0-9_-]{3,25}$\z/ }
  validates :name, presence: true
end
