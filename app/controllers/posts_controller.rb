class PostsController < ApplicationController

before_action :set_post, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    #redirect_to @post なぜこれではない？
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
