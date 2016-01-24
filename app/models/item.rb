class Item < ActiveRecord::Base
	belongs_to:Shopplist
	belongs_to:Product
	validates :product_id,presence:{message:'blank is not allowed'}
      validates :quantity,presence:{message:'blank is not allowed'}
      validates :quantity,numericality:{allow_nil: false,greater_than:0}
	def new
		Item.new
	end
	def getp_name
		if product_id
			p=Product.find(product_id)
		 	p.p_name
		end
	end

	def getitem
		if id
			Item.find(id)
		end
	end

end
