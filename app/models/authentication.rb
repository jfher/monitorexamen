class Authentication < ActiveRecord::Base #modelo para la autenticacion face
  
  #attr_accessible :user_id, :provider, :uid, :token, :token_secret
  belongs_to :user
  
  def post #postear en facebook
    me = FbGraph::User.me(self.token)
        me.feed!(
          :message => 'Updating via ThermMonitor -> Hi you have a thermostat on alert state please check this in our page',
          :name => 'Alarm',
          :description => 'Hi you have a thermostat on alert state please check this in our page')
  end
end
