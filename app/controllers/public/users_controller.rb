class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:user_id])
    # @posts = @user.posts
    # @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
     if
      @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました。"
      redirect_to user_mypage_path(current_user)
     else
      render :edit
     end
  end
  
  def chcek
  end

  def withdraw
  end

   private

  def user_params
    params.require(:user).permit(:name, :sex, :email, :profile_image,)
  end


  def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      redirect_to user_mypage_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end
