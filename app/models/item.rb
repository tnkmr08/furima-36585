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
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  

end
