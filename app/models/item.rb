class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_data
  belongs_to :user
  has_one_attached :image

  validates :item_name, :description, :price, presence: true
  validates :category_id, :condition_id, :postage_id, :region_id, :shipping_data, numericality: { other_than: 1 } 
end
