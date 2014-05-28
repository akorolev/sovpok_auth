class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :lot
  has_many :product_images, -> { order('top desc').limit(20) }, :dependent => :destroy
  accepts_nested_attributes_for :product_images, :allow_destroy => true

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 1000 }
  validates :price, presence: true, numericality: true
  validates :postage_val1, numericality: true, allow_blank: true
  validates :postage_info1, length: { maximum: 50 }, allow_blank: true
  validates :postage_val2, numericality: true, allow_blank: true
  validates :postage_info2, length: { maximum: 50 }, allow_blank: true
  validates :postage_val3, numericality: true, allow_blank: true
  validates :postage_info3, length: { maximum: 50 }, allow_blank: true
  validate do
    check_category_id
  end


  def top_image
  end

  def top_image=(arg)
  end

  for lvl in 0..CategoriesController::LVL_MASK.length do
    define_method "sub_category_lvl#{lvl}" do
      cur_category = read_attribute(:category_id).to_i
      idx = __method__.to_s[-1].to_i
      ret_val = [""]
      Category.where(level: idx).each do |cat|
        name = cat.name
        select_attributes = {class: cat.parent_id.to_s}
        if (cat.has_children.to_i == 0)
          select_attributes[:class] << " last"
        else
          name += " ->"
        end
        select_attributes[:selected] = "selected" if cur_category.between?(cat.id, cat.id + CategoriesController::LVL_MASK[idx] - 1)
        ret_val = ret_val << [name, cat.id, select_attributes]
      end
      ret_val
    end
    define_method "sub_category_lvl#{lvl}=" do |sub_category|
      return if sub_category.to_i == 0
      write_attribute(:category_id, sub_category) if read_attribute(:category_id).to_i < sub_category.to_i
    end

  end

  private

  def check_category_id
    category = Category.find_by(id: category_id)
    if category.nil?
      errors.add("sub_category_lvl0", "Please select subcategory")
      errors.add(:category_id, "Please select subcategory")
      return
    end
    if category.has_children.to_i > 0
      errors.add("sub_category_lvl#{category.level + 1}", "Please select subcategory")
      errors.add(:category_id, "Please select subcategory")
    end
  end

end
