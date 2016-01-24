class Product < ActiveRecord::Base
	validates :p_name,presence:{message:'blank is not allowed'}
    validates :price,presence:{message:'blank is not allowed'}
    validates :quantity,numericality:{allow_nil: false,greater_than: 0}
	def new
		Product.new
	end
	def create
		
	end
	
end
