class UsersController < ApplicationController
    before_action :find_user, only:[:show, :edit,:update,  :destroy]

    def index
        @users = User.all
    end

    def show 
    end

    def new
        @user = User.new
    end

    def edit 
        
    end
    def create
       
       @user = User.new(user_params)

        # redirect_to @user
       if @user.save
        flash[:notice] = "Welcome to Health Review #{@user.username} you have successfully signed up"
        redirect_to user_path(@user)
       else
         render :new
       end
    end

    def update
        @user.update(user_params)
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
        params.require(:user).permit(:name, :username, :password, :is_employee)
    end

end
