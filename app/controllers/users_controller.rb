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

  def show
    @user = User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: @current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == @current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def me
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      redirect_to  users_me_path
    else
      redirect_back fallback_location: root_path, flash: {
        user: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :prefecture_id, :user_name, :age,
                                 :gender, :image, good_lang_ids: [], learn_lang_ids: [])
  end

end
