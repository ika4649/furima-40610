class Orderform
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_record_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code,    format: { with: /\A\d{3}-\d{4}\z/, message: "must be in the format 123-4567" }
    validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number,   format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digits without hyphens" }
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      address: address, 
      building_name: building_name, 
      phone_number: phone_number, 
      purchase_record_id: purchase_record.id
    )
  end 
end