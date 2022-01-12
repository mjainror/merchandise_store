class API::V1::ProductsController < API::BaseController
  def index
    @products = Product.all
  end
end
