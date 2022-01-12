class API::V1::CategoriesController < API::BaseController
  def index
    @categories = Category.all
  end
end
