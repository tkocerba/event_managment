class EventConstroller < AplicationController
  def show
  end

  private 
  
  def set_event
    @event = Event.find(params[:id])
  end
end