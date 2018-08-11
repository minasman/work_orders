require 'rack-flash'
class UserController < ApplicationController
    use Rack::Flash
    get '/signup' do 
        erb :'/users/new'
    end

    post '/signup' do   
        existing_username = User.find_by(username: params[:user][:username])
        existing_email = User.find_by(email: params[:user][:email])
        if !existing_username
            if !existing_email 
                @user = User.create(params[:user])
                session[:user_id] = @user.id 
                redirect to '/workorders'
            else
                flash[:message] = "User with #{params[:user][:email]} already exists"
                redirect to '/signup'
            end
        else
            flash[:message] = "Username already exists"
            redirect to '/signup'
        end
    end

    post '/login' do   
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect to '/workorders'
        else
            redirect to '/' 
        end
    end

    get '/logout' do 
        if Helpers.is_logged_in?(session)  
            session.clear
        end
        redirect to '/'
    end

end

