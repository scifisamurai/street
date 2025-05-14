class Product < ApplicationRecord
  has_many :line_items
  has_one_attached :image

  before_destroy :ensure_not_referenced_by_any_line_item

  # Broadcast any product model changes to any listening clients (pg 138)
  after_commit -> { broadcast_refresh_later_to 'products' }

  validates :title, :description, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title,
            uniqueness: true,
            length: { minimum: 10, message: "too short dude" }

  validate :acceptible_image

  def acceptible_image
    return unless image.attached?

    acceptable_types = [ "image/gif", "image/jpeg", "image.png" ]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a GIF, JPG or PNG image")
    end
  end

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line Items present")
      throw :abort
    end
  end
end
