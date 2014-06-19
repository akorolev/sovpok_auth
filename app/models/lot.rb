class Lot < ActiveRecord::Base
  belongs_to :user
  has_many :products

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 5000 }
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :prepay, numericality: { only_integer: true }, allow_blank: true
  validates :fee, numericality: { only_integer: true }, allow_blank: true
  validates :min_order, numericality: true, allow_blank: true
  validates :source, length: { maximum: 1000 }, allow_blank: true
  validates :condition, presence: true, length: { minimum: 15, maximum: 5000 }
#  validates :terms_of_service, acceptance: true
  validate do
    check_delivery_time
  end

  def delivery_time
    if self.min_delivery == self.max_delivery
      self.min_delivery.to_s
    else
      self.min_delivery.to_s + " - "+ self.max_delivery.to_s
    end
  end

  def delivery_time=(arg)
    val = arg.scan(/\d+/)
    self.min_delivery = val[0]
    self.max_delivery = val[-1]
  end


  private
  def check_delivery_time
    errors.add(:delivery_time, "must be in range format (e.g '7-14')") if min_delivery.nil? || (min_delivery > max_delivery)
    errors.add(:delivery_time, "must be within 60 days") if max_delivery.to_i > 60
  end

end
