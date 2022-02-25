class PostsController < ApplicationController
  before_action :authenticate_user!
  # GET / posts
  def index
    @post = Post.new
    timeline_posts
    json_response(@timeline_posts)
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
      json_response(@post, :created)
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
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
