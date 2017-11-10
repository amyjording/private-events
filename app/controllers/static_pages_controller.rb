class StaticPagesController < ApplicationController
  def home
  	  if logged_in?
    @event  = current_user.events.build
    #@attendee = User.find_by(params[:user_id])
    #@event_attendings = @event.event_attendings.build(user_id: @attendee.id)
    @event.save
      #@event  = current_user.events.build
      @feed_items = Event.all
    end
  end

  def about
  end

  def contact
  end
end
