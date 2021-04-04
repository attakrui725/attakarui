class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
    @event.title = "新規イベント"
    @event.start_at = params[:date]
  end

end
