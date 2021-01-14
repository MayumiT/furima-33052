class Item < ApplicationRecord

  belongs_to :user
  has_one :buy
  has_one_active_hash :category
  has_one_active_hash :condition
  has_one_active_hash :prefecture
  has_one_active_hash :area
  has_one_active_hash :date
end
