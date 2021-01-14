class Item < ApplicationRecord

  belongs_to :user
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :area
  belongs_to :date
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :area_id
    validates :date_id
    validates :price
    validates :image
  end
  validates :category_id, numericality: { other_than: 1 } 
end