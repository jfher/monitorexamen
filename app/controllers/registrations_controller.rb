class RegistrationsController < Devise::RegistrationsController #controlador del registro para las apis face y twitter
  
  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end
  
  def build_resource(*args)
      super
      if session[:omniauth]
        @user.apply_omniauth(session[:omniauth])
        @user.valid?
      end
  end
    
end