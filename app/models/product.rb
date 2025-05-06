class Product < ApplicationRecord
  has_one_attached :image

  # Broadcast any product model changes to any listening clients (pg 138)
  after_commit -> { broadcast_refresh_later_to 'products' }
end
