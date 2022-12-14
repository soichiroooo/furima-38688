class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building,
                :phone_number, :purchase_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid.' }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line,
                   building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
