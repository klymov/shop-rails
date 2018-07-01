class Item < ApplicationRecord

  validates :name, :description, :category_id, presence: true
  validates :price, :quantity, numericality: { greater_than: 0, allow_nil: true }

  belongs_to  :category

  mount_uploaders :images, ImageUploader
  serialize :images, JSON # If you use SQLite, add this line.

=begin
  has_many    :positions
  has_many    :carts, through: :positions
=end

end