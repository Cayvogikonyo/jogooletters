class CategoriesController < ApplicationController
include CategoriesHelper

def show
	@category = Category.find(params[:id])

end

def index
  @categories = Category.all
 
  @articles = Article.order(created_at: :desc).limit(5)
  
end

def new
	@category = Category.new
end
def create
	@category = Category.new(category_params)
	@category.save
	flash.notice = "Category '#{@category.name}' has Been Created."

	redirect_to categories_path
end
def destroy
	@category = Category.find(params[:id])
	@category.destroy
	@categories = Category.all
	

	flash.notice = "Category Deleted"

	redirect_to action: "index" 
end
end
