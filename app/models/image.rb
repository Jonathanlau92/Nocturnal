class Image < ApplicationRecord
  has_one_attached :raw_file
  # Adding Profile images is to link multiple images to users as their heroes profile
  has_many :profile_images
  has_many :users, through: :profile_images

  enum image_category: { heroes: 0, common_item: 1}
end
