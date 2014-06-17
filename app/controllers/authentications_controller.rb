class AuthenticationsController < ApplicationController #controlador para las autenticaciones por face y twitter

  def index
    @authentications = current_user.authentications.all
  end
  
  def home
  end
  
  def post
    token = Authentication.find(params[:id])
    me = FbGraph::User.me(token.token)
        me.feed!(
          :message => 'Updating via ThermMonitor -> Hi you have a thermostat on alert state please check this in our page',
          :name => 'Alarm',
          :description => 'Hi you have a thermostat on alert state please check this in our page')
        redirect_to :back
  end

  def twitter
     omni = request.env["omniauth.auth"]
     authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])

     if authentication
       authentication_twitter(authentication)
     
     elsif current_user
      currentuser_twitter(omni)
     else
      userappli_twitter(omni)
     end 
   end

   def userappli_twitter(omni)
    user = User.new 
       user.apply_omniauth(omni)
       if user.save
         flash[:notice] = "Logged in."
         sign_in_and_redirect User.find(user.id)             
       else
         #session[:omniauth] = omni.except('extra')
         flash[:notice] = "You dont have Authentication with Twitter"
         redirect_to '/users/login'
       end
   end
   
   def authentication_twitter(authentication)
    flash[:notice] = "Logged in Successfully"
    sign_in_and_redirect User.find(authentication.user_id)
   end

   def currentuser_twitter(omni)
    token = omni['credentials'].token
       token_secret = omni['credentials'].secret

       current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
       flash[:notice] = "Authentication successful."
       sign_in_and_redirect current_user
   end

   def destroy
     @authentication = Authentication.find(params[:id])
     @authentication.destroy
     redirect_to authentications_url, :notice => "Successfully destroyed authentication."
   end
   
   
   def facebook
     omni = request.env["omniauth.auth"]
     authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])

     if authentication
      authentication_facebook(authentication)
     elsif current_user
      currentuser_facebook(omni)
     else
      userappli_facebook(omni)
     end
   end
end

def authentication_facebook(authentication)
       flash[:notice] = "Logged in Successfully"
       sign_in_and_redirect User.find(authentication.user_id)
end

def currentuser_facebook(omni)
      
       token = omni['credentials'].token
       token_secret = ""

       current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)

       flash[:notice] = "Authentication successful."
       sign_in_and_redirect current_user
end

def userappli_facebook(omni)
       user = User.new
       user.email = omni['extra']['raw_info'].email 

       user.apply_omniauth(omni)

       if user.save
         flash[:notice] = "Logged in."
         sign_in_and_redirect User.find(user.id)             
       else
         flash[:notice] = "You dont have Authentication with Twitter"
         redirect_to '/users/login'
         #session[:omniauth] = omni.except('extra')
         #redirect_to new_user_registration_path
       end
end
