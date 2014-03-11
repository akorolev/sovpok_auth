class Category < ActiveRecord::Base
  extend FriendlyId
  self.primary_key = :id
  friendly_id :name, use: :slugged
  validates :name, presence: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
