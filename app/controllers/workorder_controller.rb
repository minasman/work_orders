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
        if Helpers.is_logged_in?(session)  
            erb :'/workorders/new'
        else 
            redirect to '/'
        end
    end

    post '/workorders' do 
        if Helpers.is_logged_in?(session)  
            workorder = Workorder.create(params[:workorder])
            workorder.user_id = session[:user_id]
            workorder.save
            binding.pry
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

    get '/workorders/:id/edit' do  
        if Helpers.is_logged_in?(session)    
            @workorder = Workorder.find_by_id(params[:id])
            erb :'/workorders/edit'
        else
            redirect to '/'
        end
    end

    patch '/workorders/:id' do   
        if Helpers.is_logged_in?(session) 
            workorder = Workorder.update(params[:id], params[:work_order])
            workorder.save
            redirect to '/workorders'
        else
            redirect to '/'
        end
    end

    get '/workorders/:id/update' do   
        if Helpers.is_logged_in?(session) 
            @workorder = Workorder.find_by_id(params[:id])
            erb :'/workorders/update'
        else
            redirect to '/'
        end
    end

    post '/workorders/:id' do    
        if Helpers.is_logged_in?(session) 
            workorder = Workorder.find_by_id(params[:id])
            current_update = CurrentUpdate.create(params[:current_update])
            current_update.workorder_id = workorder.id
            current_update.username = User.find_by_id(session[:user_id]).username
            current_update.save
            binding.pry
        else 
            redirect to '/'
        end

    end

end