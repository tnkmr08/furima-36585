class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :day
  belongs_to :delivery_fee
  belongs_to :prefecture

  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than: 1 , message: "can't be blank"}
  validates :days_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  validates :image, presence: true

end
