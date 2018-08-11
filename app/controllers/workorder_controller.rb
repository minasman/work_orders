class WorkorderController < ApplicationController

    get '/workorders' do    
        if Helpers.is_logged_in?(session)  
            @workorders = Workorder.order(:store_number)
            erb :'/workorders/index'
        else
            redirect to '/'
        end
    end

    get '/workorders/new' do   
        erb :'/workorders/new'
    end

    post '/workorders' do 
        if Helpers.is_logged_in?(session)  
            work_order = Workorder.create(params[:work_order])
            work_order.user_id = session[:user_id]
            work_order.save
            redirect to '/workorders'
        else
            redirect to '/'
        end
    end

    get '/workorders/:id' do   
        if Helpers.is_logged_in?(session)  
            @workorder = Workorder.find_by_id(params[:id])
            erb :'workorders/show'
        else
            redirect to '/'
        end
    end


end