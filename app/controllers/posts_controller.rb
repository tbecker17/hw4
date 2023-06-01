class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if @current_user
      @post = Post.new(post_params)
      @post.user = @current_user
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        redirect_to @post
      else
        render :new
      end
    else
      flash[:notice] = 'You must be logged in to create a post.'
      redirect_to login_path
    end
  end
  private
def post_params
  params.require(:post).permit(:title, :description, :place_id) 
end
def show
  @post = Post.find(params[:id])
  @place = @post.place
end

  before_action :allow_cors
   def allow_cors
     response.headers['Access-Control-Allow-Origin'] = '*'
     response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
     response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
     response.headers['Access-Control-Max-Age'] = '1728000'
   end
end