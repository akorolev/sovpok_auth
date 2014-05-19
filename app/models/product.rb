class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :lot
  has_many :product_images, :dependent => :destroy
  accepts_nested_attributes_for :product_images, :allow_destroy => true
end
