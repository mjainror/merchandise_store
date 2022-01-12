class API::V1::ProductsController < API::BaseController
  before_action :load_resource!, only: %w(update)

  def index
    @products = Product.all.order("id ASC")
  end

  def update
    if @product.update(product_params)
      render_success!
    else
      unprocessable_entity(@product.errors.full_messages.join(", "))
    end
  end

  protected

  def product_params
    params.require(:product).permit(:price_cents, :price_currency)
  end

  def load_resource!
    @product = Product.find(params[:id])
  end
end
