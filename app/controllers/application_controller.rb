
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "elreymcd"
  end

  get '/' do        
    erb :index
  end
  
  get '/main' do 
    if Helpers.is_logged_in?(session)
      erb :'/main'
    else
      redirect to '/'
    end
  end
end