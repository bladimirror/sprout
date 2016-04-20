class User < ActiveRecord::Base
	has_many :user_events

	##### FORM DATA VALIDATIONS #####
	#EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	#validates :first_name, presence: true, length: {in: 2..30}
	#validates :last_name, presence: true, length: {in: 2..30}
	#validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
	#validates :password, presence: true, length: {in: 8..100}

	##### DOWN-CASING FORM DATA #####
	before_save do
		self.first_name.downcase!
		self.last_name.downcase!
		self.email.downcase!
	end
end
