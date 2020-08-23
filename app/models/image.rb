class Image < ApplicationRecord
  has_one_attached :raw_file

  enum image_category: { heroes: 0, common_item: 1}
end
