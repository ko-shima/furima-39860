class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :region_id, :city, :block, :building, :phone_number, :order

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end