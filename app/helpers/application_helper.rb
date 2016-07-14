module ApplicationHelper
  def send_categories
    @categories = Category.all
  end
end
