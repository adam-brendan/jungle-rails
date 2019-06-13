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
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/"
        else
            puts "This is executing!"
            render :new
        end
        # @user.email = params[:user][:email]
        # @user.password = params[:user][:password]
        # @user.password_confirmation = params[:user][:password_confirmation]
        # @user.first_name = params[:user][:first_name]
        # @user.last_name = params[:user][:last_name]
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
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
end
