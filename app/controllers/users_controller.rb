class UsersController < ApplicationController
  def index
    @search = User.ransack(params[:q])
    @good_langs = GoodLangRelation.all
    @users = @search.result(distinct: true).includes(:good_langs) #この行を修正

    #respond_to do |format|
     # format.html # index.html.erb
      #format.json { render json: @users }
    #end
  end

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

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :prefecture_id, :user_name, :age,
                                 :gender, good_lang_ids: [], learn_lang_ids: [])
  end

end
