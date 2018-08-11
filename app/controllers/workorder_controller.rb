require 'date'
require 'time'
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
            workorder.status = "open"
            workorder.date = Date.today.strftime("%m/%d/%Y")
            workorder.time = Time.now.strftime("%I:%M%p")
            workorder.save
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
            if session[:user_id] ==  Workorder.find_by_id(params[:id]).user_id 
                @workorder = Workorder.find_by_id(params[:id])
                erb :'/workorders/edit'
            else
                redirect to '/workorders'
            end
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
            current_update.date = Date.today.strftime("%m/%d/%Y")
            current_update.time = Time.now.strftime("%I:%M%p")
            current_update.save
            workorder.current_updates << current_update
            if params[:status] == "closed" 
                workorder.status = "closed"
            end
            workorder.save
            redirect to '/workorders'
        else 
            redirect to '/'
        end
    end

    get '/workorders/:id/close' do   
        if Helpers.is_logged_in?(session) 
            @workorder = Workorder.find_by_id(params[:id])
            erb :'/workorders/close'
        else
            redirect to '/'
        end
    end

    post '/workorders/:id/close' do   
        if Helpers.is_logged_in?(session) 
            workorder = Workorder.find_by_id(params[:id])
            workorder.status = "closed"
            workorder.closed_date = params[:closed_date]
            workorder.closed_notes = params[:closed_notes]
            workorder.closed_by = User.find_by_id(session[:user_id]).username 
            workorder.save
            redirect to '/workorders'
        else
            redirect'/'
        end
    end

end