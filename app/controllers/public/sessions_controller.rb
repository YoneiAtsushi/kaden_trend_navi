# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: "ゲストユーザーとしてログインしました。"
  end

  def after_sign_in_path_for(resource)
    posts_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private


  # def user_state
  #   @user = User.find_by(email: params[:user][:email])
  #   if @user
  #     if @user.valid_password?(params[:user][:password]) && !@user.is_active
  #       flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、再度ご登録をしてご利用ください。'
  #       redirect_to new_user_session_path
  #     end
  #   end
  # end


  def reject_user
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.user_status == true)
        flash[:notice] = "お客様は退会済みです。申し訳ございませんが、再度ご登録をしてご利用ください。"
        redirect_to new_user_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    else
      flash[:notice] = "該当するユーザーが見つかりません"
    end
  end
end
