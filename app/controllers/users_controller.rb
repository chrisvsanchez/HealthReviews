class UsersController < ApplicationController
    before_action :find_user, only:[:show, :update, :edit, :destroy]
    def index
        @users = User.all
    end

    def show 
    end

    def new
        @user = User.new
    end

    def create
       @user = User.create(user_params)
        redirect_to @user

    end
    def edit 

    end
    def update
        @user = User.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
    end

    private 
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :username, :password, :is_employee, :hospitals_id)
    end
    
end
