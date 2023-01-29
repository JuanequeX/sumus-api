class PostsController < ApplicationController
  # GET data for /posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # Get data for only one posts
  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  # POST a new post /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content, status: :ok
  end

  private
    def post_params
      params.require(:post).permit(:email, :comment)
    end
end
