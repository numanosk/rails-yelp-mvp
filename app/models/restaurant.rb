class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  def self.categories
    CATEGORIES
  end
  validates :category, inclusion: { in: Restaurant.categories }
end



