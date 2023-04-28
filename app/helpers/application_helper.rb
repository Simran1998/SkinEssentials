module ApplicationHelper
  def breadcrumbs(controller, action)
    crumbs = []
    product = @product
    category = @category
    if controller == "products" && action == "index"
      crumbs << link_to("Home", root_path)
    elsif controller == "products" && action == "show"
      crumbs << link_to("Home", root_path)
      crumbs << link_to("Products", products_path)
      crumbs << link_to(product.category.name, category_path(product.category))
      crumbs << product.name
    elsif controller == "categories" && action == "show"
      crumbs << link_to("Home", root_path)
      crumbs << link_to("Categories", categories_path)
      crumbs << category.name
    end
    crumb_str = ""
    crumbs.each_with_index do |crumb, i|
      crumb_str += if i == crumbs.length - 1
                     "<span class='active'>#{crumb}</span>"
                   else
                     "#{crumb} &raquo; "
                   end
    end
    crumb_str.html_safe
  end
end
