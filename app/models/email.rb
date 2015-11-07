class Email < ActiveRecord::Base
	belongs_to :user
	attr_accessible :address
	validates :address, presence: true, uniquness: {case_senstive: false}
	before_create do
		self.verification_token = SecureRamdom.hex
	end 
		
	end
end
