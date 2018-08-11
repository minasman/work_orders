class UserController < ApplicationController

    get '/signup' do   
        erb :'/users/new'
    end

    post '/signup' do   
        #see all workorders
        #add work orders
        #edit work orders
        #see list of stores

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
        session.clear
        redirect to '/'
    end

end

