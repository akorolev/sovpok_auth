class Lot < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

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
