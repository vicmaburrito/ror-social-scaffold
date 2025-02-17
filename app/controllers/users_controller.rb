class UsersController < ApplicationController
  before_action :authenticate_user!
  respond_to :js, :json, :html

  def index
    @users = User.all
    render json: [current_user]
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end
end
