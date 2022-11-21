class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show] # 修正TechLog では投稿の閲覧についてはログインを必要としないため、authenticate_user!から show アクションは対象外とします。
  
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id # ログインユーザのIDを代入
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to root_path # 一時的にトップページへリダイレクト(要修正)
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show # 追加
    @post = Post.find_by(id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
