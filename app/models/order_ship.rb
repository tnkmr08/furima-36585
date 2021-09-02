class OrderShip
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :telephone_number, :user_id, :item_id, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :block, presence: true
  VARID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :telephone_number, presence: true, format: {with: VARID_PHONE_REGEX}
  validates :token, presence: true
  

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Ship.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end  