class UserController < ApplicationController

    get '/signup' do   
        erb :'/users/new'
    end

    post '/signup' do   
        @user = User.create(params[:user])
        session[:user_id] = @user.id 
        redirect to '/workorders'
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

