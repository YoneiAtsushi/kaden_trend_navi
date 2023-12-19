class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count_many, -> {order(star: :desc)}
  scope :star_count_few, -> {order(star: :asc)}
  
end
