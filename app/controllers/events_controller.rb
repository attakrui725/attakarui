class EventsController < ApplicationController
  def top
  end

  def index
    @events = Event.all
    render json: @events.map{|event|
      {
        id: event.id,
        title: event.title,
        start: event.start_at,
      }
    }
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end
  private
  def event_params
    params.require(:event).permit(:title, :start_at)
  end
end
