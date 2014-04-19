class Lot < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 15, maximum: 1000 }
  validates :end_date, presence: true
  validates :prepay, numericality: { only_integer: true }, allow_blank: true
  validates :fee, numericality: { only_integer: true }, allow_blank: true
  validates :min_order, numericality: true, allow_blank: true
  validates :pickup_description, length: { maximum: 1000 }, allow_blank: true
  validates :postage_val1, numericality: true, allow_blank: true
  validates :postage_info1, length: { maximum: 50 }, allow_blank: true
  validates :postage_val2, numericality: true, allow_blank: true
  validates :postage_info2, length: { maximum: 50 }, allow_blank: true
  validates :postage_val3, numericality: true, allow_blank: true
  validates :postage_info3, length: { maximum: 50 }, allow_blank: true
  validates :source, length: { maximum: 50 }, allow_blank: true

  validates :category_id, presence: true

  validates :condition, presence: true, length: { minimum: 15, maximum: 1000 }
  validates :terms_of_service, acceptance: true


  for lvl in 0..CategoriesController::LVL_MASK.length do 
    define_method "sub_category_lvl#{lvl}" do
      idx = __method__.to_s[-1]
      ret_val = [""]
      Category.where(level: idx).each do |cat|
        chained_class = "last " if (cat.has_children.to_i == 0)  
        chained_class = chained_class.to_s + cat.parent_id.to_s
        ret_val = ret_val << [cat.name, cat.id, {:class => chained_class}]
      end
      ret_val
    end
  end

end
