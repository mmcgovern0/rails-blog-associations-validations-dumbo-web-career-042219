class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    set_tag
  end

  def new
    @post = Post.new
  end

  def edit
    set_tag
  end

  def create
    @post = Post.create(post_params)
  end

  def update
    set_tag
    @post.update(post_params)
  end

 
  def destroy
    set_post
    @post.destroy
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :content)
    end
end
