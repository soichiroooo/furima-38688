class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :shipping_charge
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :shipping_date
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :name, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' },
                    numericality: { in: 300..9_999_999, message: 'is out of setting range' }
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :user, presence: true

  validates :image, presence: true
  has_one_attached :image

  belongs_to :user
  has_one :purchase
end
