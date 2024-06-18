class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
      @user = User.new
    end

    def show
      @user = current_user
    end  

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user, notice: 'Usuario creado exitosamente.'
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      if params[:id] == 'sign_out'
        @user = nil
      else
        @user = User.find(params[:id])
    end    
  end
end