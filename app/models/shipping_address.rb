class ShippingAddress < ApplicationRecord
  #アソシエーションの追加
  belongs_to :purchase_record

  #バリデーションの追加
  #validates :postal_code,    presence:true, format: { with: /\A\d{3}-\d{4}\z/, message: "must be in the format 123-4567" }
  #validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank"}
  #validates :city,           presence:true
  #validates :address,        presence:true
  #validates :phone_number,   presence:true, format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digits without hyphens" }
end
