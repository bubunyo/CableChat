class Room < ApplicationRecord
  validates :name, format: { with: /\A[a-z0-9_-]{3,25}$\z/ }
  validates :name, presence: true
  before_create :set_count

  private
  def set_count
    if self.count.nil?
      self.count = 0;
    end
  end
end
