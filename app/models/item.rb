class Item < ApplicationRecord

  belongs_to :user
  has_one :buy
  has_one_active_hash :category
  has_one_active_hash :condition
  has_one_active_hash :prefecture
  has_one_active_hash :area
  has_one_active_hash :date

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :area_id
    validates :date_id
    validates :price
  end
end
