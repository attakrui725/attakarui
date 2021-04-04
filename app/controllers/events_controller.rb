class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
    @event.title = "新規イベント"
    @event.start_at = params[:date]
  end

   def create
    @event = Event.new(event_params)
    @event.save
    redirect_to root_path
  end
  private
  def event_params
    params.require(:event).permit(:title, :start_at)
  end
end
