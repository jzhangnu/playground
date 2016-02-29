class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]
  def index
    @posts = Post.all.order("created_at DESC")

  end

  def new
    @post =Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

    if @post.update(post_params)
      redirect_to @post
    end
  end

  def destory
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end