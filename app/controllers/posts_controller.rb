class PostsController < ApplicationController
  include Response
  before_action :authenticate_user!
  # GET / posts
  def index
    @post = Post.new
    timeline_posts
    render json: @timeline_posts, status: :ok
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render json: { message: 'Post Created!' } }
      end
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
      render json: @post, status: :unprocessable_entity
    end
  end

  private

  def timeline_posts
    @timeline_posts ||= current_user.friends_and_own_posts
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
