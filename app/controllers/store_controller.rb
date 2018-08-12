class StoreController < ApplicationController

    get '/stores' do 
        if Helpers.is_logged_in?(session) 
            @stores = Store.order(:store_number)
            erb :'/stores/index'
        else
            redirect to '/'
        end
    end

    get '/stores/new' do    
        if Helpers.is_logged_in?(session) 
            erb :'/stores/new'  
        else
            redirect to '/'
        end

    end

    post '/stores' do 
        if Helpers.is_logged_in?(session) 
            params[:store][:store_number] = params[:store][:store_number].to_i
            store = Store.create(params[:store])
            store.save
            redirect to '/stores'
        else
            redirect to '/'
        end
    end

    get '/stores/:id' do   
        if Helpers.is_logged_in?(session) 
            @store = Store.find_by_id(params[:id]) 
            @workorders = Workorder.all 
            erb :'/stores/show'
        else
            redirect to '/'
        end
    end
    
    get '/stores/:id/edit' do   
        if Helpers.is_logged_in?(session) 
            @store = Store.find_by_id(params[:id])  
            erb :'/stores/edit'
        else
            redirect to '/'
        end
    end

    patch '/stores/:id' do   
        if Helpers.is_logged_in?(session)
            params[:store][:store_number] = params[:store][:store_number].to_i
            store = Store.update(params[:id], params[:store])
            store.save
            redirect to '/stores'
        else
            redirect to '/'
        end
    end

    delete '/stores/:id/delete' do 
        if Helpers.is_logged_in?(session)
            @store = Store.find_by_id(params[:id])
            @store.delete
            redirect to '/stores'
        else
            redirect to '/'
        end
    end

end
