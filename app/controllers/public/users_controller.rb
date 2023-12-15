class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts.page(params[:page]).per(5)
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
      flash[:notice] = "ユーザ情報の更新が完了しました。"
      redirect_to user_mypage_path(current_user)
     else
      render :edit
     end
  end
  
  def chcek
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(user_status: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
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
