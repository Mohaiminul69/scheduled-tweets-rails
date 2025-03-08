class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            redirect_to root_path, notice: "Successfully logged in"
            session[:user_id] = user.id
        else
            flash.now[:alert] = "Invalid login credentials"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Successfully logged out"
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end