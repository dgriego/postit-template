class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  # 1. setup instance variable for action
  # 2. redirect based on some condition

  def index # GET /posts
    @posts = Post.all
  end

  def new # GET /posts/new new_post_path
    @post = Post.new
  end

  def create # POST /posts posts_path
    @post = Post.new(post_params)
    @post.creator = User.first # TODO: change once we have authentication
    @post.category_ids = post_params[:category_ids]

    if @post.save
      flash[:notice] = 'Your post was created.'
      redirect_to posts_path
    else
      render :new
    end
  end

  def show # GET /posts/1 post_path
    @comment = Comment.new
  end

  def edit # GET /posts/1/edit edit_post_path
    @categories = Category.all
  end

  def update # PUT/PATCH /posts/1 post_path
    @post.category_ids = params[:category_ids]

    if @post.update(post_params)
      flash[:notice] = 'Your post has been updated'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).
      permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
