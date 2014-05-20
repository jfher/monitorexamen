class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :begin_usu
  before_save :begin_usu2
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :thermostats     

	def begin_usu
		self.state=true
		self.role='simple'
	end

	def begin_usu2
		if self.id == 1
			self.role= 'admin'
		end
	end

end
