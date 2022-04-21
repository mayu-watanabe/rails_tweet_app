class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :check_same_logined_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @like_count = Like.where(post_id: params[:id]).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content], user_id: session[:user_id])
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  def check_same_logined_user
    post = Post.find_by(id: params[:id])
    if session[:user_id] != post.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
