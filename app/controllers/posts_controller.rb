class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :startDate, :endDate, :allDay, :memo))
    if @post.save
      flash[:alert] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash[:alert] = "スケジュールを登録に失敗しました"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title,:startDate,:endDate,:allDay,:memo))
      flash[:alert] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash[:alert] = "スケジュールの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :posts
  end
end
