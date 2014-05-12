class ProductImage < ActiveRecord::Base
  belongs_to :product
  has_attached_file :photo, :styles => { :medium => "200x200>", :thumb => "50x50>",:large => "400x400>"  }, :default_url => ":style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :photo, :less_than => 5.megabytes
end
