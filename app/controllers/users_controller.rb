class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @created_upcoming_events = @user.events.upcoming_events
    @created_prev_events = @user.events.previous_events
    @attending_upcoming_events = @user.attended_events.upcoming_events
    @attending_prev_events = @user.attended_events.previous_events
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "Welcome! It's time to make your first event."
      redirect_to root_url
    else
      render 'new'
    end
  end


    def user_params
      params.require(:user).permit(:name, :email)
    end  

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
