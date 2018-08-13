require 'rack-flash'

class StoreController < ApplicationController
    use Rack::Flash

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
            existing_store_number = Store.find_by(store_number: params[:store][:store_number])
            existing_email = Store.find_by(email: params[:store][:email])
            existing_store = Store.find_by(name: params[:store][:name])
            if !existing_store_number
                if !existing_email
                    if !existing_store
                        params[:store][:store_number] = params[:store][:store_number].to_i
                        store = Store.create(params[:store])
                        store.save
                        redirect to '/stores'
                    else
                        flash[:message] = "#{params[:store][:name]} already exists"
                        redirect to '/stores/new'
                    end
                else
                    flash[:message] = "#{params[:store][:email]}  already exists"
                    redirect to '/stores/new'
                end
            else
                flash[:message] = "#{params[:store][:store_number]} already exists"
                redirect to '/stores/new'
            end
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
