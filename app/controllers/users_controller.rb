class UsersController < ApplicationController

before_action :authenticate_user!
before_action :set_user_article, only: [:show, :edit]
before_action :set_current_user, only: [:edit, :update, :destroy]
before_action :set_like_total, only: [:show]

  def show
    @users = User.where(user_id: @user)
    @follower = @user.followers
    @articles = Article.where( user_id: @user ).order( "id DESC" )
    @modal_articles = Article.where( user_id: @user ).order( "created_at DESC" ).limit(2)
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

    def set_current_user
      @user = User.find(current_user)
    end

    def set_like_total
      @user = User.find(params[:id])
      count = 0
      @user.comments.each do |comment|
        a = comment.like_counts.to_i
        count += a
      end
      @counts = count
    end

end
