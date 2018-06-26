class Item < ApplicationRecord

  validates :name, :description, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :quantity, numericality: { greater_than: 0, allow_nil: true }


=begin
  belongs_to  :category
  has_many    :positions
  has_many    :carts, through: :positions
=end

end
