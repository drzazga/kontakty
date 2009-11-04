class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    @category.save

    redirect_to root_url
  end
end
