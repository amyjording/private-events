class EventAttendingsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]

end
