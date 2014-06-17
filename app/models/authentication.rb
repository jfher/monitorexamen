class Authentication < ActiveRecord::Base #modelo para la autenticacion face
  
  #attr_accessible :user_id, :provider, :uid, :token, :token_secret
  belongs_to :user
end
