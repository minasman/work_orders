require 'rack-flash'
class UserController < ApplicationController
    use Rack::Flash

    get '/signup' do 
        if Helpers.is_logged_in?(session)
            flash[:message] = "#{User.find_by_id(session[:user_id]).username} is Logged in"
            redirect to '/main'
        else
            erb :'/users/new'
        end
    end

    post '/signup' do   
        existing_username = User.find_by(username: params[:user][:username])
        existing_email = User.find_by(email: params[:user][:email])
        if !existing_username
            if !existing_email 
                @user = User.create(params[:user])
                session[:user_id] = @user.id 
                redirect to '/main'
            else
                flash[:message] = "User with #{params[:user][:email]} already exists"
                redirect to '/signup'
            end
        else
            flash[:message] = "Username already exists"
            redirect to '/signup'
        end
    end

    get '/login' do    
        if !Helpers.is_logged_in?(session)
            erb :'users/login'
        else
            redirect to '/main'
        end
    end

    post '/login' do   
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect to '/main'
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

