class Post < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :title, presence: true
  validates :description, presence: true
  has_one_attached :uploaded_image
end


