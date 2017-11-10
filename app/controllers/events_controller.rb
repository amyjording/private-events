class EventsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @events = Event.all
    @upcoming_events = Event.upcoming_events
    @past_events = Event.previous_events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new

  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Private event created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def update
  end

  def destroy
    @event.destroy
    flash[:success] = "Private event deleted"
    redirect_back(fallback_location: root_url)
  end

  private

    def event_params
      params.require(:event).permit(:title, :event_date, :description, { :invite_ids => [:user_id] })
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end  

end
