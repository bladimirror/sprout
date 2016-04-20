class Product < ActiveRecord::Base
	belongs_to :users

	validates :product_name, presence: true, length: {in: 2..30}

	before_save do
		self.product_name.downcase!
		self.product_description.downcase!
	end
end
