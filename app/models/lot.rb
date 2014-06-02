class Lot < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :products

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 15, maximum: 1000 }
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :delivery_time, presence: true, numericality: { only_integer: true }
  validates :prepay, numericality: { only_integer: true }, allow_blank: true
  validates :fee, numericality: { only_integer: true }, allow_blank: true
  validates :min_order, numericality: true, allow_blank: true
  validates :source, length: { maximum: 80 }, allow_blank: true
  validates :condition, presence: true, length: { minimum: 15, maximum: 1000 }
#  validates :terms_of_service, acceptance: true

  private


end
