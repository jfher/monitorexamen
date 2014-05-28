class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :begin_usu
  before_save :begin_usu2
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :thermostats  

  scope :search, lambda { |search_word| where('users.email LIKE ?', "%#{search_word}%") }

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
