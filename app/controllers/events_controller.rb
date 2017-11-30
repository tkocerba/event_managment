class EventsController < ApplicationController
  before_action :set_category!, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_event!, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @event = @category.events.build
  end

  def create
    @event = @category.events.build(event_params)

    if @event.save
      flash[:success] = "Event has been added"
      redirect_to category_event_path(@category, @event)
    else
      render :new
    end
  end

  def edit  
  end

  def update
    if @event.update_attributes(event_params)
      flash[:success] = "Event has been udpated!"
      redirect_to category_event_path(@category, @event)
    else
      render :edit
    end
  end

  def destroy
    if @event.destroy
      flash[:success] = "Event has been removed!"
    else
      flash[:danger] = "Cannot remove event. Try again later."
    end

    redirect_to category_event_path(@category, @event)
  end

  def show
  end

  private 
  
  def set_category!
    @category = Category.find(params[:category_id])
  end

  def set_event!
    @event = @category.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :starts_at, :ends_at)
  end
end