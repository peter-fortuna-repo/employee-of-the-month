class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
    else
        render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
        flash[:notice] = 'Post was successfully updated.'
        redirect_to @post
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post was successfully deleted.'
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :month_year, :description)
  end
end