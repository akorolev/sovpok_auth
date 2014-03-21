module CategoriesHelper
  def navigate_categories(id)
      nav_pathes=[{path:"", name:""}]
      cur_id = 0;
      CategoriesController::LVL_MASK.each do |item|
        if (item & id.to_i) != 0
          cur_id  += item & id.to_i
          rec = Category.find_by(id: cur_id)
          nav_pathes << {path: nav_pathes[-1][:path].to_s + rec.friendly_id+"/", name: rec.name}
        end
      end
      nav_pathes.shift
      nav_pathes
  end
  def top_categories
     @categories ||= Category.where(parent_id: nil)
  end
end
