class Item < ApplicationRecord

  validates :name, :description, :category_id, presence: true
  validates :price, :quantity, numericality: { greater_than: 0, allow_nil: true }

  belongs_to  :category

=begin
  has_many    :positions
  has_many    :carts, through: :positions
=end

end