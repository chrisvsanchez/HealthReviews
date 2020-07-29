class SessionsController < ActionController::Base

    
    def new
      render :new
    
    end


    def create

      user = User.find_by(username: params[:session][:username])
      # compare their password to whatever password was passed in the form
      if user.authenticate(params[:session][:password])
        # if the password is correct, save the user_id to the session
            session[:user_id] = user.id 
            redirect_to root_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to root_path
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
