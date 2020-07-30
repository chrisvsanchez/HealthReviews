class SessionsController < ActionController::Base

    
    def new
      render :new
    
    end


    def create
        @user = User.find_by(username: params[:username])
    
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash.now[:alert] = "Username or password is incorrect"
            render action: "new"
        end
    end

    def destroy
        # byebug
        session.delete(:user_id)
        redirect_to about_path
    end

    def reset_view_tracker
        session[:view_tracker] = 3
    
    end

end
