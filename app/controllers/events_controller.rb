class EventsController < ApplicationController
  def top; end

  def index
    @events = Event.all
    render json: @events.map { |event|
      {
        id: event.id,
        title: event.title,
        start: event.start_at,
        color: event.is_done ? '#AAAAAA' : nil
      }
    }
  end

  def new
    @event = Event.new
    @event.title = '新規イベント'
    @event.title = Event::TEMPLATES[params[:template_key].to_sym] if params[:template_key]
    @event.start_at = params[:date]
  end

  def create
    @event = Event.new(event_params)
    if params[:template_key]
      @event.image.attach(
        io: File.open(Rails.root.join('public', "#{params[:template_key]}.png")),
        filename: "#{params[:template_key]}.png",
        content_type: 'image/png'
      )
    end
    @event.save
    redirect_to root_path
  end

  def edit
    @event = Event.find(params[:id])
    @event.title = Event::TEMPLATES[params[:template_key].to_sym] if params[:template_key]
  end

  def update
    @event = Event.find(params[:id])
    if params[:template_key]
      @event.image.attach(
        io: File.open(Rails.root.join('public', "#{params[:template_key]}.png")),
        filename: "#{params[:template_key]}.png",
        content_type: 'image/png'
      )
    end
    @event.update(event_params)
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  def edit_template
    @event = Event.find(params[:event_id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :start_at, :image, :is_done)
  end
end
