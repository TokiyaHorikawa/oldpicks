class UsersController < ApplicationController

before_action :authenticate_user!
before_action :set_user_article, only: [:show, :follow, :follower, :edit]
before_action :set_user_modal, only: [:show, :follow, :follower]
before_action :set_current_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @articles = Article.order('created_at DESC').limit(8)
  end

  def follow
  end

  def follower
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to :root
  end

  def destroy
    @user.destroy
    redirect_to :root, notice: 'アカウントの削除が完了しました'
  end
  private
    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :company,
        :position,
        :profile,
        :avatar_image
      )
    end

    def set_user_article
      @article = Article.new
      @comment = Comment.new
    end

    def set_user_modal
      @modal_articles = Article.order('created_at DESC').limit(2)
    end

    def set_current_user
      @user = User.find(current_user)
    end

end
