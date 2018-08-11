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
        erb :'/workorders/index'

    end
    


end

