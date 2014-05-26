class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :lot
  has_many :product_images, -> { order('top desc').limit(20) }, :dependent => :destroy
  accepts_nested_attributes_for :product_images, :allow_destroy => true

  def top_image
  end

  def top_image=(arg)
  end
end
