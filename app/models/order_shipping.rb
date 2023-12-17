class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :region_id, :city, :block, :building, :phone_number, :order

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_code, presence: true
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_number, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    shipping.create(postal_code: postal_code, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end