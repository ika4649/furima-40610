class Item < ApplicationRecord
  #アソシエーションの追加
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :shipping_day

  #バリデーションの追加
  validates :name,                   presence: true
  validates :description,            presence: true
  validates :category_id,            numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id,           numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_fee_burden_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id,          numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_day_id,        numericality: { other_than: 1, message: "can't be blank"}
  validates :price,                  presence: true,
                                     numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9_999_999, message: "must be a number between ¥300 and ¥9,999,999" }
end
