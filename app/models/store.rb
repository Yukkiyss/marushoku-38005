class Store < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # has_many :comments

  validates :store_name, presence: true
  validates :store_environment, presence: true
  validates :recommendation, presence: true
  validates :image, presence: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

end
