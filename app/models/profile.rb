class Profile < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "50x50>" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
end