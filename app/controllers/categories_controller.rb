class CategoriesController < ApplicationController
  before_action :set_category!, only: [:edit, :update, :show, :destroy]
  def index
    @categories = Category.order(id: :asc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'Category added!'
      redirect_to categories_path
    else
      render :new
    end
  end
   
  def show
    @events = @category.events.order(created_at: :desc)
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Category #{@category.title} has been updated!"
      redirect_to categories_path
    else
      render :edit  
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "#{@category.title} has been removed!"
    else
      flash[:danger] = "Cannot remove category #{@category.title}!"
    end    

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
  
  def set_category!
    @category = Category.find_by(id: params[:id])
  end
end