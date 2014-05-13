class ProductImage < ActiveRecord::Base
  belongs_to :product
  has_attached_file :photo, :styles => { :medium => "200x200>", :thumb => "50x50>",:large => "400x400>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_presence_of :photo, :message => 'is invalid or inaccessible'

  def picture_from_url(url)
    val = URI.parse(url)
    self.photo = val
  rescue
    puts "*********************************** URI PARSE!!!"
  end

  def to_jq_upload
    {
        "id" => read_attribute(:id),
        "name" => read_attribute(:photo_file_name),
        "size" => read_attribute(:photo_file_size),
        "url" => upload.url(:original),
        "delete_url" => product_image_path(self),
        "delete_type" => "DELETE",
        "thumbnail_url" => upload.url(:medium),
    }
  end

end
