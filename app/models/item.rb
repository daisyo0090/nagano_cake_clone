class Item < ApplicationRecord
  attachment :image
  belongs_to :genres
end
