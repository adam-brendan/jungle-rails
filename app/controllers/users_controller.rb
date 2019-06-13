class UsersController < ApplicationController

    def show
        # this doesn't work
        @user = User.find params[:id]
    end


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.email = params[:user][:email]
        @user.password = BCrypt::Password.create(params[:user][:password])
        @user.save!
        redirect_to "/"
    end

    def login
        @user = User.find_by_email(params[:email])
        if @user.password == params[:password]
            give_token
        else
            redirect_to "/"
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
      end
end
