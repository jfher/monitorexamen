class User < ActiveRecord::Base #modelo del usuario
  # Include default devise modules. Others available are:auta
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :begin_usu
  before_save :begin_admi
  devise :database_authenticatable, :registerable,  :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :thermostats  
  has_many :locations  
  has_many :authentications

  #attr_accessible :email, :password, :password_confirmation, :remember_me

  scope :search, lambda { |search_word| where('users.email LIKE ?', "%#{search_word}%") }

	def begin_usu
		self.state=true
		self.role='simple'
	end

	def begin_admi
		if self.id == 1
			self.role= 'admin'
		end
	end

	def apply_omniauth(omni)
        authentications.build(:provider => omni['provider'],
        :uid => omni['uid'],
        :token => omni['credentials'].token,
        :token_secret => omni['credentials'].secret)
    end

    def password_required?
        (authentications.empty? || !password.blank?) && super
    end

    def update_with_password(params, *options)
      if encrypted_password.blank?
         update_attributes(params, *options)
      else
         super
      end
    end

end
