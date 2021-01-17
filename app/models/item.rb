class Item < ApplicationRecord

  belongs_to :user
  has_one :buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :area_id
    validates :day_id
  end
end