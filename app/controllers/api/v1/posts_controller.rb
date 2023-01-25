class Api::V1::PostsController < ApplicationController
  # GET data for /posts
  def index
    @posts = Posts.all
    render json: @posts
  end

  # Get data for only one posts
  def show
    render json: @post
  end

  # POST a new post /posts
  def create
    @post = Post.new(post_params)
    if @poss.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
