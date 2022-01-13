class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @new_product = Product.new
  end
  
  def create
    @new_product = Product.new(product_params)

    if @new_product.save
      redirect_to @new_product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @edit_product = Product.find(params[:id])
  end

  def update
    @edit_product = Product.find(params[:id])

    if @edit_product.update(product_params)
      redirect_to @edit_product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :price, :qty)
  end

end
