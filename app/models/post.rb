class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_one_attached :image
  
  
  
  validates :product_name, presence: true
  validates :title,        presence: true, length: { minimum: 3, maximum: 35 }
  validates :introduction, presence: true
  validates :star,         presence: true
  # validates :genre_id,     presence: true
  
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count_many, -> {order(star: :desc)}
  scope :star_count_few, -> {order(star: :asc)}
  
end
