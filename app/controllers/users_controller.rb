class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    #good_lang = GoodLangRelation.new()
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      redirect_back fallback_location: root_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def me
  end

  def search
    @user = User.new()
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, good_lang_ids: [],  learn_lang_ids: [])
  end

end
