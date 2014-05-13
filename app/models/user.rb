class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   before_create :begin_usu
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :thermostats     
   
	def begin_usu
		self.state=true
		if self.id==1
			self.role='admin'
		else
		self.role='simple'
	    end
	end

end
