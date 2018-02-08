class UsersController < ApplicationController

before_action :authenticate_user!

  def show
  end

  def edit
    @user = User.find(current_user)
    @article = Article.new
    @comment = Comment.new
  end

  def update
    @user = User.find(current_user)
    @user.update(user_params)
    redirect_to :root
  end

  def destroy
    user = User.find(current_user)
    user.destroy
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

end
